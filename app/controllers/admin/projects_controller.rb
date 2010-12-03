class Admin::ProjectsController < Admin::BaseController
  before_filter :require_admin

  # GET /admin_projects
  # GET /admin_projects.xml
  def index
    @projects = Project.all.paginate(
      :select => "distinct `projects`.*",
      :page => params[:page], 
      :per_page => 40
    )
  end

  # GET /admin_projects/1
  # GET /admin_projects/1.xml
  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
  end

  # GET /admin_projects/new
  # GET /admin_projects/new.xml
  def new
    @project = Project.new
    @project.company_id = current_user.id
  end

  # GET /admin_projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /admin_projects
  # POST /admin_projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(admin_project_path(@project), :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_projects/1
  # PUT /admin_projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(admin_project_path(@project), :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_projects/1
  # DELETE /admin_projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(admin_projects_url) }
      format.xml  { head :ok }
    end
  end
end
