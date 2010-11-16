class Attachment < ActiveRecord::Base
  
  has_attached_file :data, 
    :url => "/system/attachments/:attachment/:id/:style/:filename",
    :path => ":rails_root/public/system/attachments/:attachment/:id/:style/:filename"
    
  belongs_to :user
  belongs_to :document, :foreign_key => 'parent_id'
end
