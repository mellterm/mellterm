class Admin::LanguagesController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    @languages = Language.all
  end
  
  def show
    @language = Language.find(params[:id])
  end
  
  def new
    @language = Language.new
  end
  
  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = "Successfully created language."
      redirect_to admin_languages_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @language = Language.find(params[:id])
  end
  
  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(params[:language])
      flash[:notice] = "Successfully updated language."
      redirect_to admin_languages_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    flash[:notice] = "Successfully destroyed language."
    redirect_to admin_languages_url
  end
end
