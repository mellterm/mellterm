class Admin::UsersController < Admin::BaseController
  
  # GET /admin/users
  # GET /admin/users.xml
  def index
    @users = User.paginate :page => params[:page], :per_page => @per_page, :order => "login ASC"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.xml
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
    
  end

  # GET /admin/users/new
  # GET /admin/users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  rescue
    @user = current_user
  end

  # PUT /admin/users/1
  # PUT /admin/users/1.xml
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        #@user.update_roles(params[:user][:role_ids])
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to edit_admin_user_path(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.xml
  def destroy
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.destroy
        flash[:success] = "User deleted"
        format.html { redirect_to(admin_users_path) }
        format.xml  { head :ok }
      else
        flash[:error] = "Could not delete user"
        format.html { redirect_to(admin_users_path) }
      end
    end
  end
  
  # POST /admin/users
  # POST /admin/users.xml
  def create
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to(admin_users_path)
      flash[:success] = "User has been created."
    else
      flash[:error]  = "User could not be created."
      render :action => 'new'
    end
  end
  
  
  def activate
    @user = User.find(params[:id])
    success = @user.activate_user
    if success && @user.errors.empty?
      flash[:success] = "User has been Activated."
      redirect_to(admin_users_path)
    else
      flash[:error]  = "User could not be Activated."
      redirect_to(admin_users_path)
    end
  end
  
  def deactivate
    @user = User.find(params[:id])
    success = @user.deactivate_user
    if success && @user.errors.empty?
      flash[:success] = "User has been Deactivated."
      redirect_to(admin_users_path)
    else
      flash[:error]  = "Could not Deactivate User."
      redirect_to(admin_users_path)
    end
  end

  private
  
  def destroy_denied
    flash[:error] = "Error: You cannot delete this user."
    redirect_to admin_users_path
  end
  
  def record_not_found
    flash[:error] = "Error: User not found."
    redirect_to admin_users_path
  end
end
