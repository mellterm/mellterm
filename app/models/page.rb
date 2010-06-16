class Page < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :language
  
  def language_title
    self.language.title if self.language
  end
end
