class Document < ActiveRecord::Base
  belongs_to :user
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
    unless (data && data["file"] && data["version"] && data["xmlns"] && data["xmlns"].match("xliff:document") && true)
      return false
    end
    
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
    self.send(:update_without_callbacks)
  end
  
  
end
