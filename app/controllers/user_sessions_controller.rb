class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def show
    if current_user && current_user.admin
      redirect_to admin_path
    else
      redirect_to root_path
    end
  end
  
  def new
    @user_session = UserSession.new
    @title = "Login"
  end
  
  def create
    @title = "Please Login"
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to :action => 'show'
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
