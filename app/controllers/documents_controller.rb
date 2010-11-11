class DocumentsController < ApplicationController
  before_filter :require_user
  
  # GET /documents
  # GET /documents.xml
  def index
    @documents = current_user.documents
    @title = "My Documents"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = Document.find(params[:id])
    @segments = @document.segments.paginate(
      :page => params[:page], 
      :order => "segments.id ASC",
      :include => [:source_language,:target_language, :user, :category],
      :per_page => 100
    )
    
    @first_id = @document.segments.first.id if !@segments.empty?
    
    @title ="#{@document.data_file_name} (#{@document.xliff_source_language})"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @title ="Upload New Document"
    @document = Document.new
    @document.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    @document.user_id = current_user.id
    @title ="Editing '#{@document.data_file_name}'"
  end

  # POST /documents
  # POST /documents.xml
  def create
    @document = Document.new(params[:document])
    @document.user_id = current_user.id

    if on_windows?
      flash[:error] = "File Processing not compatible with Windows"
    end
    respond_to do |format|
      if @document.save
        format.html { redirect_to(edit_document_path(@document), :notice => 'Document was successfully created.') }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.xml
  def update
    @document = Document.find(params[:id])
    @document.user_id = current_user.id
    
    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to(edit_document_path(@document), :notice => 'Document was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml  { head :ok }
    end
  end
end
