class Segment < ActiveRecord::Base
  
  belongs_to :source_language, :class_name => "Language"
  belongs_to :target_language, :class_name => "Language"
  belongs_to :user
  belongs_to :category
  
  def self.import_tmx(user_id,category_id,file)
    require 'xmlsimple'
    config = XmlSimple.xml_in(file.read,{ 'ForceContent' => true })
    header = config["header"][0]
    body = config["body"][0]
    tu = body["tu"]

    # Some info from header
    creationtoolversion = header["creationtoolversion"]
    creationtool = header["creationtool"]
    creationdate = header["creationdate"]
    creationid = header["creationid"]
    segtype = header["segtype"]
    otmf = header["o-tmf"]
    srclang = header["srclang"]
    adminlang = header["adminlang"]
    
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
        :crd => creationdate,
        :cru => creationid,
        :user_id => user_id,
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
    # Clean up
    tu =nil
    body=nil
    header=nil
    config=nil
    GC.start
    return {:total => @total, :rejected => @rejected, :msg => msg}
  end
  
end
