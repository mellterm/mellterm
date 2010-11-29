# Giang Nguyen
class Project < ActiveRecord::Base
  has_many                :tasks
  belongs_to              :company
  has_many_and_belongs_to :users
  belongs_to              :pt_status
end

