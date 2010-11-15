class Translation < ActiveRecord::Base
  
  has_and_belongs_to_many :categories
  belongs_to :source_language, :class_name => "Language"
  belongs_to :target_language, :class_name => "Language"
  belongs_to :company
  belongs_to :user
  
  validates_format_of :pos, 
    :with => /(adj|adv|phr|pl|noun)/ , 
    :allow_blank => true, 
    :allow_nil => true
  
  validates_presence_of :source_content, :target_content
  
  def category_name
    category.title if self.category
  end
  
  def category_description
    category.description if self.category
  end
  
  def company_name
    company.title if self.company
  end
  
  def matching_segments(limit=10)
    Segment.
      source_language_title_like(self.source_language.title).
      source_content_like(self.source_content)
  end
  
  def matching_segments_and_domains(limit=10)
  end
  
end
