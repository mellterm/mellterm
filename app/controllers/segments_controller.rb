class SegmentsController < ApplicationController
  
  before_filter :require_user
  
  def index
    @title ="All of My Segments"
    # @search = Translation.search(params[:search])
    conditions = nil
    if params[:categories] && !params[:categories].empty?
      cat_ids = params[:categories].join(" OR category_id = ")
      conditions = ["category_id = #{cat_ids}"]
      # ids = []
      # params[:categories].each {|t| ids << t.to_i}
      # @search = Segment.categories_id_equals(ids).search(params[:search])
    else
      @segment_search = Segment.search(params[:search])
    end
    @segments = @segment_search.paginate(
      # :select => "distinct `segments`.*",
      :conditions => conditions, 
      :page => params[:page], 
      :per_page => 40,
      :order => "segments.id ASC",
      :include => [:source_language, :target_language, :category, :user]
    )
  end

  # def index
  #   @title = "Segments"
  #   @segments = current_user.segments.paginate(
  #     :page => params[:page], 
  #     :order => order_by, 
  #     :include => [:source_language,:target_language, :user, :category],
  #     :per_page => 50
  #   )
  # end
  
  def show
    @segment = current_user.segments.find(params[:id])
  end
  
  def new
    @title = "New Segment"
    @segment = Segment.new
    @segment.user_id = current_user.id
    @segment.updated_by = current_user.id
  end
  
  def create
    @segment = Segment.new(params[:segment])
    @segment.user_id = current_user.id
    @segment.updated_by = current_user.id
    if @segment.save
      flash[:notice] = "Successfully created segment."
      redirect_to segments_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @segment = current_user.segments.find(params[:id])
    @segment.updated_by = current_user.id
    if @segment.document
      @title = "Editing Segment from #{@segment.document.data_file_name}"
    end
  end
  
  def update_ajax
    @segment = current_user.segments.find(params[:id])
    @segment.updated_by = current_user.id
    @segment.update_attributes(params[:segment].merge(:updated_by => current_user))
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @segment = current_user.segments.find(params[:id])
    @segment.updated_by = current_user.id
    respond_to do |format|
      if @segment.update_attributes(params[:segment].merge(:updated_by => current_user)) 
        flash[:success] = "Successfully updated record."
        format.html { 
          if @segment.document
            redirect_to @segment.document
          else
            redirect_to @segment
          end
        }
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
      @segment = current_user.segments.find(params[:id])
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
