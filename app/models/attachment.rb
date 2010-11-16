class Attachment < ActiveRecord::Base
  has_attached_file :data,
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:filename"
  belongs_to :user
  belongs_to :document, :foreign_key => 'parent_id'
end
