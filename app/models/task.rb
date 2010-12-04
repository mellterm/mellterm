# Giang Nguyen
class Task < ActiveRecord::Base
  has_one                 :segment
  belongs_to              :project
  has_and_belongs_to_many :users
  belongs_to              :pt_status
end
