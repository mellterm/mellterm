class Admin::AttachmentsController < Admin::BaseController
      
  def index
    @attachments = Attachment.paginate :page => params[:page], 
      :per_page => @per_page,
      :order => "id DESC"
  end
  
  def show
    @attachment = Attachment.find(params[:id])
  end
  
  def new
    @attachment = Attachment.new
  end
  
  def create
    @attachment = Attachment.new(params[:attachment])
    if @attachment.save
      flash[:success] = "Successfully created File."
      redirect_to edit_admin_attachment_path(@attachment)
    else
      flash[:error] = "Could not crate File yet."
      render :action => 'new'
    end
  end
  
  def edit
    @attachment = Attachment.find(params[:id])
  end
  
  def update
    @attachment = Attachment.find(params[:id])
    if @attachment.update_attributes(params[:attachment])
      flash[:success] = "Successfully updated File."
      redirect_to edit_admin_attachment_path(@attachment)
    else
      flash[:error] = "Could not update File."
      render :action => 'edit'
    end
  end
  
  def destroy
    @attachment = Attachment.find(params[:id])
    if @attachment.item
      return_url = edit_admin_item_path(@attachment.item.id)
    else
      return_url = admin_attachments_url
    end
    @attachment.destroy
    flash[:success] = "Successfully destroyed File."
    redirect_to return_url
  end
  

end
