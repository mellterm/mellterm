class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :segments, :dependent => :destroy
  
  has_attached_file :data
  validates_attachment_presence :data
  
  after_save :convert_to_utf8, :set_mime, :process_file
  
  def on_windows?
    if RUBY_PLATFORM =~ /(:?mswin|win32|mingw|bccwin)/
      return true
    else
      return false
    end
  end
  
  def set_mime
    self.data_content_type = self.mime_type
    self.file_encoding = self.mime_encoding
    self.send(:update_without_callbacks)
  end
  
  def process_file
    return true if on_windows?
    file_path = self.data.path
    
    # If File is a zip file
    if self.data.path.match("(\.zip)$") && mime_type.match("zip")
      Rails.logger.info("[file] File is ZIP")
      file_list = unzip_files
      file_list.each do |file|
        # process each file inside the zip file.
        new_file = convert_once_to_utf8(file) #TODO
        import_processed_file(new_file)
      end
      return true
    end
    
    # If extension is CSV
    if file_path.match("(\.csv)$")
      Rails.logger.info("[file] #{file_path} is CSV")
      import_csv
      return true
    else
      # Import the files if we have a file object
      import_processed_file(file_path)
    end
  end
    
  
  # TODO: need to convert to UTF8 the files inside the zip
  # Unzips the given zipfile and returns array of extracted files
  # i.e. => ["/var/folders/TfTfz2FcPBEJSC/-Tmp-/test.tmp"]
  def unzip_files
    # Checks if file is really a zip file
    if on_windows?
      Rails.logger.info("[file] Unzipping is not compatible with windows")
      return false
    end
    
    return false unless self.mime_type.match("zip")
    file = self.data.path
    # Then proceed if it's a zip file
    require 'zip/zip'
    destination = Dir.tmpdir
    extracted_files = []
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |f|
        if f.file? && !f.name.downcase.match(/(\.ds_store|thumbs\.db)/)
          logger.info("[file] Processing #{f.name} from ZIP file")
          f_path=File.join(destination, f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          zip_file.extract(f, f_path) unless File.exist?(f_path)
          extracted_files << f_path
        else
          logger.info("[file] Skipping #{f.name} from ZIP file")
        end
      }
    }
    # Array with zip files
    extracted_files
  end
  
  
  def mime_encoding
    get_mime_encoding(self.data.path)
  end
  def mime_type
    get_mime_type(self.data.path)
  end
  
  # This method only convert the file to UTF8 and saves it
  # it will also create a backup file.
  def convert_to_utf8
    require 'tempfile'
    require 'ftools' # <= only ruby-1.8
    old_path = self.data.path
    mime_encoding = self.mime_encoding
    mime_type = self.mime_type
    # Only allow UTF-8 
    if mime_encoding.match("(UTF-8|US-ASCII|BINARY)") or mime_type.match("zip")
      logger.info "[file] File already good format or can't convert: #{mime_encoding}"
      true
    else
      tmp_file = Tempfile.new("/tmp")
      logger.debug "[file] Found File #{tmp_file} encoding to be: #{mime_encoding}"
      logger.debug "[file] Converting #{tmp_file} from #{mime_encoding} to UTF-8"
      logger.debug "[file] Command: iconv -f #{mime_encoding} -t UTF-8 #{old_path} >> #{tmp_file.path}"
      # Create a new temp file to store the new converted file
      # Backup old file in case
      logger.debug("[file] Backing up #{old_path} to #{old_path}.bak")
      File.copy(old_path, "#{old_path}.bak")
      conversion = system("iconv -f #{mime_encoding} -t UTF-8 #{old_path} >> #{tmp_file.path}")
      if conversion
        new_encoding = `file -b --mime-encoding #{tmp_file.path}`.chomp.upcase
        logger.debug "[file] New file encoding: #{new_encoding}"
        # Now copy back new encoded tmp_file to original File location.
        File.copy(tmp_file.path, old_path)
        logger.debug "[file] Copied #{tmp_file.path} to #{old_path}"
        # then delete Temp File used to convert encoding.
        logger.debug "[file] Deleting tmp file: #{tmp_file.path}"
        tmp_file.close!
      end
    end
    # always return true to skip and ignore errors for now.
    return true
  end
  
  # Importing XLF Files
  def import_xlf(data)
    file_content = data["file"].first
    @trans_unit = file_content["body"].first["trans-unit"]
    
    self.xliff_xmlns = data["xmlns"].to_s
    self.xliff_version = data["version"].to_s
    self.xliff_original = file_content["original"].to_s
    self.xliff_source_language = file_content["source-language"].to_s.downcase
    self.xliff_datatype = file_content["datatype"].to_s
    
    # Looking for the language on the database, 
    # if not found, then create new one.
    if self.xliff_source_language && !self.xliff_source_language.empty?
      lang = Language.find_or_create_by_title(self.xliff_source_language)
      lang_id = lang.id
    else
      lang_id = nil
    end
    @total = 0 
    @rejected = 0 
    
    @trans_unit.each do |t|
      from  = nil
      to    = nil
      from  = t['source'][0]['content'].to_s if (t['source'] && t['source'][0] && t['source'][0]['content'])
      to    = t['target'][0]['content'].to_s if (t['target'] && t['target'][0] && t['target'][0]['content'])
      seg = Segment.create(
        :category_id => self.category_id,
        :source_content => from,
        :target_content => to,
        :source_language_id => lang_id,
        :user_id => self.user_id,
        :raw_data => t.to_s
      )
      self.segments << seg
    end
    
    # Clean up
    data=nil
    @trans_unit=nil
    GC.start
    
    self.send(:update_without_callbacks)
  end
  
  
  # Importing TMX Files
  def import_tmx(data)
    header = data["header"].first
    body = data["body"].first
    tu = body["tu"]

    # Some info from header
    creationtoolversion = header["creationtoolversion"] # Need to add to DB.
    creationtool = header["creationtool"] # Need to add to DB.
    creationdate = header["creationdate"] # Need to add to DB.
    creationid = header["creationid"] # Need to add to DB.
    segtype = header["segtype"] # Need to add to DB.
    otmf = header["o-tmf"]
    srclang = header["srclang"]
    adminlang = header["adminlang"]
    
    self.xliff_version = data["version"].to_s
    self.xliff_source_language = srclang.to_s.downcase
    self.xliff_datatype = header["datatype"]
    self.xliff_xmlns = otmf
    
    # counters
    @total=0
    @rejected=0
    
    # Using the first entry to get languange, to speep up.
    # since all elements use only the same 2 languages
    #@from_lang = tu[0]["tuv"][0]["xml:lang"]
    from_lang = srclang.to_s.downcase # get source language from header
    to_lang   = tu[0]["tuv"][1]["xml:lang"].to_s.downcase
    
    source_language = Language.find_or_create_by_title(from_lang)
    target_language = Language.find_or_create_by_title(to_lang)
    
    # Looking for the language on the database, 
    # if not found, then create new one.
    if self.xliff_source_language && !self.xliff_source_language.empty?
      lang = Language.find_or_create_by_title(self.xliff_source_language)
      lang_id = lang.id
    else
      lang_id = nil
    end
    
    
    tu.each do |t|
      from      = t["tuv"][0]["seg"][0]["content"].to_s
      to        = t["tuv"][1]["seg"][0]["content"].to_s
      # puts "#{from_lang} -> #{from}"
      # puts "#{to_lang} -> #{to}"
      
      if Segment.create(
        :source_content => from,
        :target_content => to,
        :source_language_id => source_language.id,
        :target_language_id => target_language.id,
        :category_id => category_id,
        :document_id => self.id,
        :user_id => self.user_id,
        :crd => creationdate,
        :cru => creationid,
        :raw_data => t.to_s)
        @total+=1
      else
        @rejected+=1
      end
    end
    
    # Memory Clean up
    tu =nil
    body=nil
    header=nil
    data=nil
    GC.start
    
    self.send(:update_without_callbacks)
  end
  
  
  def import_csv
    require "fastercsv"
    require 'tempfile'
    file = self.data.path
    mime_encoding = self.mime_encoding
  
    arr_of_arrs = FasterCSV.read(file.path)
    # de_de, en_gb,category,company, notes
    @source_language = Language.find_or_create_by_title(arr_of_arrs[0][0].to_s)
    @target_language = Language.find_or_create_by_title(arr_of_arrs[0][1].to_s)
    arr_of_arrs.delete_at(0)
    @total = 0
  
    # TODO: Get company and category from the form.
    # if not present on the csv file, then 
    # "csv_file"=>{"company"=>"FRED2", "domain"=>"FRED1"}
    if params[:csv_file][:company_id]
      @bypass_company_id = params[:csv_file][:company_id]
    else
      @bypass_company_id = nil
    end
    
    if params[:csv_file][:category_ids]
      @bypass_category_ids = params[:csv_file][:category_ids]
    else
      @bypass_category_ids = nil
    end
    
    @bypass_user_id = nil
    @company_count_start = Company.count
    @category_count_start = Category.count
  
    arr_of_arrs.each do |row|
      @source_content = row[0].to_s
      @target_content = row[1].to_s
    
      @source_content = @source_content.toutf8 unless @source_content.is_utf8?
      @target_content = @target_content.toutf8 unless @target_content.is_utf8?
    
      # will look for the categories on the CSV file.
      # if they are there, ignore the one from the form. 
      categories = row[2].to_s.split(",")
      unless categories.empty?
        @csv_categories = []
        categories.each do |t|
          cat = Category.find_or_create_by_title(t)
          @csv_categories << cat.id if cat
        end
      else
        @csv_categories = @bypass_category_ids
      end
    
      # will look for the company on the CSV file
      # if not found on the database, then create it.
      company = row[3].to_s
      if company.empty?
        @company_id = @bypass_company_id
      else
        @company = Company.find_or_create_by_title(company)
        @company_id = @company.id if @company
      end
    
      user_id = nil
      if @bypass_user_id
        user_id = @bypass_user_id
      else
        user_id = current_user.id if current_user
      end
    
      # @category_id = Category.find_or_create_by_title(row[2].to_s).id unless row[2].to_s.blank?
      # @company_id = Company.find_or_create_by_title(row[3].to_s) unless row[3].to_s.blank?
    
      @notes = row[4].to_s
      if (@tr = Translation.create(
          :source_content => @source_content,
          :target_content => @target_content,
          :source_language_id => @source_language.id,
          :target_language_id => @target_language.id,
          :company_id => @company_id,
          :notes => @notes,
          :user_id => user_id)
        )
        @total+=1
        @tr.category_ids = @csv_categories
      end
    end
    @company_count = Company.count-@category_count_start
    @category_count = Category.count-@category_count_start
  
    flash[:success] = "#{@total} entries were successfully imported."
    flash[:success] << "<br />#{@category_count} new domains were created." if (@category_count>0)
    flash[:success] << "<br />#{@company_count} new companies were created." if (@company_count>0)
    file.close!
  end
  
  
    
  protected
  
    # Check File Encoding from File System. Linux/BSD only
    def get_mime_encoding(filepath)
      `file -b --mime-encoding #{filepath}`.chomp.upcase unless on_windows?
    end
    # Check File Type from File System. Linux/BSD only
    def get_mime_type(filepath)
      `file -b --mime-type #{filepath}`.chomp.downcase unless on_windows?
    end
    
    # Check for Allowed file types.
    def validate
      errors.add("file_type", "is SdlXliff. This type of file is not supported.") if
        self.data.path.downcase.match("(\.sdlxliff)$")
      errors.add("file_type", "only XML, TMX, CSV, TXT, XLF, XLIFF and ZIP are supported.") unless 
        self.data.path.downcase.match("(\.xml|\.tmx|\.csv|\.txt|\.xliff|\.xlf|\.zip)$")
    end
    
    # Check the type of document and parse it
    def import_processed_file(file)
      require 'xmlsimple'
      data = XmlSimple.xml_in(File.read(file), {'ForceContent' => true})

      # check if the file is really an xliff file
      if (data && data["xmlns:sdl"] && data["xmlns:sdl"].match("SdlXliff"))
        Rails.logger.info("[file] #{file} is xmlns. Not Processing")
        return false
      elsif (data && data["file"] && data["version"] && data["xmlns"] && data["xmlns"].match("xliff:document"))
        import_xlf(data)
      elsif (data && data["header"] && data["version"] && data["body"] && data["body"].size > 0 && data["body"].first["tu"])
        import_tmx(data)
      else
        return false
      end
    end
    
    def convert_once_to_utf8(file)
      require 'tempfile'
      require 'ftools' # <= only ruby-1.8
      mime_encoding = get_mime_encoding(file)
      mime_type = get_mime_type(file)
      # Only allow UTF-8 
      if mime_encoding.match("(UTF-8|US-ASCII|BINARY)") or mime_type.match("zip")
        logger.info "[file] File #{file} is already in good format or can't be converted from #{mime_encoding}"
        return file
      else
        tmp_file = Tempfile.new("/tmp")
        logger.debug "[file] Found File #{tmp_file} encoding to be: #{mime_encoding}"
        logger.debug "[file] Converting #{tmp_file} from #{mime_encoding} to UTF-8"
        logger.debug "[file] Command: iconv -f #{mime_encoding} -t UTF-8 #{file} >> #{tmp_file.path}"
        # Create a new temp file to store the new converted file
        # Backup old file in case
        logger.debug("[file] Backing up #{file} to #{file}.bak")
        File.copy(file, "#{file}.bak")
        conversion = system("iconv -f #{mime_encoding} -t UTF-8 #{file} >> #{tmp_file.path}")
        if conversion
          new_encoding = `file -b --mime-encoding #{tmp_file.path}`.chomp.upcase
          logger.debug "[file] New file encoding: #{new_encoding}"
          # Now copy back new encoded tmp_file to original File location.
          File.copy(tmp_file.path, file)
          logger.debug "[file] Copied #{tmp_file.path} to #{file}"
          # then delete Temp File used to convert encoding.
          logger.debug "[file] Deleting tmp file: #{tmp_file.path}"
          tmp_file.close!
        end
        file
      end
      # always return true to skip and ignore errors for now.
      return file
    end
  
end
