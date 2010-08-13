class Company < ActiveRecord::Base
  has_many :translations
  validates_presence_of :title
  validates_uniqueness_of :title
end
