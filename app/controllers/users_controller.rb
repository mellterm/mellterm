class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  # GET /users
  # GET /users.xml
  def index
    @user = current_user
    @title = "Account"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = current_user
    @title = "Account"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @title = "Registration"
    @user = User.new
    # @user.admin = false
  end
  
  def create
    @title = "Registration"
    @user = User.new(params[:user])
    if @user.save
      @user.categories << Category.find(:all, :conditions => ["owner_id = ?",false])
      flash[:success] = "Registration successful."
      redirect_to edit_account_path
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit Account"
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated profile."
      redirect_to edit_account_path
    else
      render :action => 'edit'
    end
  end
  
end
