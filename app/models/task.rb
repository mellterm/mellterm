# Giang Nguyen
class Task < ActiveRecord::Base
  has_many                :segments
  belongs_to              :project
  has_and_belongs_to_many :users
  belongs_to              :pt_status
end
