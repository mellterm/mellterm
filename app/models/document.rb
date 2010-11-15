class Document < ActiveRecord::Base  
  
  belongs_to :user
  belongs_to :category
  has_many :segments, :dependent => :destroy
  has_many :translations, :dependent => :destroy
  
  has_attached_file :data
  validates_attachment_presence :data
  
  after_save :convert_to_utf8, :set_mime, :process_file
  
  # This method will export to XLF
  def export_to_xlf
    
  end
  
  def is_csv?
    self.data_file_name.match("(\.csv)$")
  end
  
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
    if mime_encoding.match("(UTF-8|US-ASCII|BINARY|UNKNOWN)") or mime_type.match("zip")
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
      logger.debug "[tmx] #{from_lang} -> #{from}"
      logger.debug "[tmx] #{to_lang} -> #{to}"
      logger.debug "======"
      
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
    user_id = self.user_id
    
    # Read the CSV file in memory.
    arr_of_arrs = FasterCSV.read(file)
    # DE_DE EN_GB TYPE DOMAIN COMPANY APPROVED DOCID/DOCNAME POS SOURCE NOTES AUTHORITY
    # de_de,en_gb,type,domain,company,approved, Document_id, pos, source, notes, authority
    @source_language = Language.find_or_create_by_title(arr_of_arrs[0][0].to_s)
    @target_language = Language.find_or_create_by_title(arr_of_arrs[0][1].to_s)
    arr_of_arrs.delete_at(0)
    @total = 0
  
    arr_of_arrs.each do |row|
      @source_content = row[0].to_s
      @target_content = row[1].to_s
    
      @source_content = @source_content.toutf8 unless @source_content.is_utf8?
      @target_content = @target_content.toutf8 unless @target_content.is_utf8?
    
      term_type = row[2].to_s

      # Domain. find or create new one
      row3 = row[3].to_s
      if row3.empty?
        category_id = self.category_id
      else
        category_id = Category.find_or_create_by_title(row3).id
      end
      
      # Company. find or create new one
      row4 = row[4].to_s
      if row4.empty?
        company_id = nil
      else
        company_id = Company.find_or_create_by_title(row4).id
      end
      
      # Approved, if it has a "y" in there then approve.
      # and if company is specified also approve.
      if row[5].to_s.match(/(y|yes)/) or company_id
        approved = true
      else
        approved = false
      end
      
      is_public = self.public

      # DocID/DocName
      doc_name = row[6].to_s
      
      # POS
      pos = row[7].to_s.downcase
      if pos.empty?
        pos = "noun"
      end
      
      # Source
      source = row[8].to_s
         
      # Notes
      notes = row[9].to_s
      
      # Authority
      authority = row[10].to_s
      
      if (@tr = Translation.create(
          :source_content => @source_content,
          :target_content => @target_content,
          :source_language_id => @source_language.id,
          :target_language_id => @target_language.id,
          :user_id => user_id,
          :company_id => company_id,
          :approved => approved,
          :is_public => is_public,
          :doc_name => doc_name,
          :pos => pos,
          :source => source,
          :notes => notes,
          :authority => authority
          )
        )
        @total+=1
        @tr.category_ids = [category_id] if category_id
        self.translations << @tr
      end
    end
    
    logger.info("[file] CSV File #{file} processed #{@total} entries")
  end
  
  
  
  # Private methods.
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
