class Admin::DashboardController < Admin::BaseController  
  
  def index
    @logged_users = User.last_logged
  end
    
end

