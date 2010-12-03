class Project < ActiveRecord::Base
  has_many                :tasks
  belongs_to              :company
  has_and_belongs_to_many :users
  belongs_to              :pt_status
  
  # This is the user that create the Project, or Project Owner
  belongs_to  :owner,   :foreign_key => "owner_id",   :class_name => "User"
  
end
