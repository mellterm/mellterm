class Category < ActiveRecord::Base
  validates_presence_of :title
  has_many :translations
end
