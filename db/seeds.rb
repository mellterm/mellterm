# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:login => "admin",
  :email => "admin@localhost.com",
  :password => "welcome", 
  :password_confirmation => "welcome" 
)
user = User.find(:first, :conditions => ["login = ?", "admin"])
if user
  user.admin = true
  user.save
end


Page.create(:title => "home", :permalink => "home", :body => "This is home Page. Require Page to be there")

PtStatus.create(:name => "New", :description => "")
PtStatus.create(:name => "Assigned", :description => "")
PtStatus.create(:name => "Approved", :description => "")

