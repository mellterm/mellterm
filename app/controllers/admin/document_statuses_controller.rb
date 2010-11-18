class Admin::DocumentStatusesController < Admin::BaseController
  before_filter :require_admin
  
  # GET /document_statuses
  # GET /document_statuses.xml
  def index
    @document_statuses = DocumentStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @document_statuses }
    end
  end

  # GET /document_statuses/1
  # GET /document_statuses/1.xml
  def show
    @document_status = DocumentStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document_status }
    end
  end

  # GET /document_statuses/new
  # GET /document_statuses/new.xml
  def new
    @document_status = DocumentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document_status }
    end
  end

  # GET /document_statuses/1/edit
  def edit
    @document_status = DocumentStatus.find(params[:id])
  end

  # POST /document_statuses
  # POST /document_statuses.xml
  def create
    @document_status = DocumentStatus.new(params[:document_status])

    respond_to do |format|
      if @document_status.save
        format.html { redirect_to(admin_document_statuses_url, :notice => 'DocumentStatus was successfully created.') }
        format.xml  { render :xml => @document_status, :status => :created, :location => @document_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /document_statuses/1
  # PUT /document_statuses/1.xml
  def update
    @document_status = DocumentStatus.find(params[:id])

    respond_to do |format|
      if @document_status.update_attributes(params[:document_status])
        format.html { redirect_to(admin_document_statuses_url, :notice => 'DocumentStatus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /document_statuses/1
  # DELETE /document_statuses/1.xml
  def destroy
    @document_status = DocumentStatus.find(params[:id])
    @document_status.destroy

    respond_to do |format|
      format.html { redirect_to(admin_document_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
