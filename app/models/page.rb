class Page < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :language
  
  LOCATIONS = ["sidebar", "block_left", "block_right", "news", "page"] 
  named_scope :page, :conditions => ['location = ?', "page"]
  named_scope :sidebar, :conditions => ['location = ?', "sidebar"]
  named_scope :block_right, :conditions => ['location = ?', "block_right"]
  named_scope :block_left, :conditions => ['location = ?', "block_left"]
  named_scope :news, :conditions => ['location = ?', "news"]
  
  def language_title
    self.language.title if self.language
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
end
