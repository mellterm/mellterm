class Segment < ActiveRecord::Base
  
  belongs_to :source_language, :class_name => "Language"
  belongs_to :target_language, :class_name => "Language"
  belongs_to :user
  belongs_to :category
  
end
