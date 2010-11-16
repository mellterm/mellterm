class Admin::SegmentsController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    @title = "Segments"
    @segments = Segment.paginate(
      :page => params[:page], 
      :order => order_by, 
      :include => [:source_language,:target_language, :user, :category],
      :per_page => 50
    )
  end
  
  def show
    @segment = Segment.find(params[:id])
  end
  
  def new
    @title = "New Segment"
    @segment = Segment.new
  end
  
  def create
    @segment = Segment.new(params[:segment])
    if @segment.save
      flash[:notice] = "Successfully created segment."
      redirect_to admin_segments_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @segment = Segment.find(params[:id])
  end
  
  def update_ajax
    @segment = Segment.find(params[:id])
    @segment.update_attributes(params[:segment])
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @segment = Segment.find(params[:id])
    respond_to do |format|
      if @segment.update_attributes(params[:segment])
        flash[:success] = "Successfully updated record."
        format.html { redirect_to admin_segments_url}
        format.xml  { head :ok }
        format.js 
      else
        flash[:error] = "There was an error saving this record"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @segment.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end
  
  def destroy
    if params[:all]
      Segment.destroy_all
      flash[:success] = "Successfully delete all Segments from database."
    else
      @segment = Segment.find(params[:id])
      @segment.destroy
      flash[:success] = "Successfully deleted Segment."
    end
    redirect_to :action => "index"
  end
  
  
  def import
    # if params[:memory_file][:file]
    #   require 'hpricot'
    #   require 'tempfile'
    #   file = params[:memory_file][:file]
    #   #file = File.read("/tmp/utf8_SCHOLL_MARKETING.xml")
    #   
    #   user_id = nil
    #   user_id = current_user.id if current_user
    #   
    #   if params[:memory_file][:category_id]
    #     category_id = params[:memory_file][:category_id].to_i
    #   else
    #     category_id = nil
    #   end
    #   
    #   # Do the import job
    #   result = Segment.import_tmx(user_id,category_id,file)
    #   @total = result[:total]
    #   @rejected = result[:rejected]
    #   flash[:success] = "#{@total} entries were successfully imported."
    #   flash[:success] << "<br />#{@rejected} were not import." if (@rejected>0)
    #   flash[:notice] = result[:msg]
    #   file.close
    # else
    #   flash[:error] = "No File given"
    # end
    # redirect_to :action => "index"
  end
  
end
