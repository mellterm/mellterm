class Translation < ActiveRecord::Base
  
  belongs_to :source_language, :class_name => "Language"
  belongs_to :target_language, :class_name => "Language"
  
  belongs_to :company
  belongs_to :category
  
  belongs_to :user
  
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
  
end
