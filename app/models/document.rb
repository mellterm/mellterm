class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :segments, :dependent => :destroy
  
  has_attached_file :data
  validates_attachment_presence :data
  
  after_save :process_file
  
  def process_file
    file_type = `file -b --mime-encoding #{self.data.path}`.chomp.upcase
    self.file_encoding = file_type
    
    require 'xmlsimple'
    data = XmlSimple.xml_in(File.read(self.data.path),{ 'ForceContent' => true })
    
    # check if the file is really an xliff file
    if (data && data["xmlns:sdl"] && data["xmlns:sdl"].match("SdlXliff"))
      return false
    elsif (data && data["file"] && data["version"] && data["xmlns"] && data["xmlns"].match("xliff:document"))
      import_xlf(data)
    elsif (data && data["header"] && data["version"] && data["body"] && data["body"].size > 0 && data["body"].first["tu"] )
      import_tmx(data)
    else
      return false
    end
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
      Rails.logger.info(".")
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
      Rails.logger.info(".")
    end
    
    msg="
    <h3>Information About Document :</h3> <br />
    Date         : #{creationdate} <br />
    Tool         : #{creationtool} (#{creationtoolversion}) <br />
    ID           : #{creationid} <br />
    Segment Type : #{segtype} <br />
    O-TMF        : #{otmf} <br />
    Source Lang  : #{srclang} <br />
    "
    Rails.logger.info(msg)
    
    # Memory Clean up
    tu =nil
    body=nil
    header=nil
    data=nil
    GC.start
    
    self.send(:update_without_callbacks)
  end
  
  
end
