class Admin::PagesController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    @title = "Pages"
    @pages = Page.all(:order => order_by)
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @title = "New Page"
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to admin_pages_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to admin_pages_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to admin_pages_url
  end
end
