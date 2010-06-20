class Admin::SettingsController < Admin::BaseController

  def index
		@setting = Setting.new
  end
  
  def show
    @setting = Setting.find(params[:id])
  end
  
  def new
    @setting = Setting.new
  end
  
  def create
    @setting = Setting.new(params[:setting])
    if @setting.save
      flash[:notice] = "Successfully created setting."
      redirect_to edit_admin_setting_path(@setting)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @setting = Setting.find(params[:id])
  end
  
  def update
    @setting = Setting.find(params[:id])
    
    if @setting.update_attributes(params[:setting])
      flash[:notice] = "Successfully updated setting."
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  

  def create
		Setting.create(params[:setting])
		redirect_to :action => 'index'
  end

  def update_all
    params[:settings].each do |t| 
      Setting.update_or_create(t[0],t[1])
    end
    flash[:success] = "Settings have been saved"
		redirect_to :action => 'index'
  end

  def delete
		Setting.find(params[:id]).destroy
		redirect_to :action => 'index'
  end
end
