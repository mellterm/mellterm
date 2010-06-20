class UsersController < ApplicationController
  before_filter :require_user

  def index
    @user = current_user
    @title = "Account"
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @users }
    end
  end


  def edit
    @title = "Edit Account"
    @user = current_user
  end

  def update
    @user.admin = false unless current_user.admin
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated profile."
      redirect_to edit_account_path
    else
      render :action => 'edit'
    end
  end
  
end
