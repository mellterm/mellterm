class Admin::SegmentsController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    @title = "Segments"
    @segments = Segment.paginate(:page => params[:page], :order => order_by, :per_page => 25)
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
  
  def update
    @segment = Segment.find(params[:id])
    if @segment.update_attributes(params[:segment])
      flash[:notice] = "Successfully updated segment."
      redirect_to admin_segments_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if params[:all]
      Segment.destroy_all
      flash[:success] = "Successfully delete all Segments from database."
    else
      @segment = Segments.find(params[:id])
      @segment.destroy
      flash[:success] = "Successfully deleted Segment."
    end
    redirect_to admin_segments_url
  end
  
  
  def import    
    if params[:memory_file][:file]
      require 'hpricot'
      require 'tempfile'
      file = params[:memory_file][:file]
      # file = File.read("/tmp/sample_TM_3.txt")
      @total = 0
      @rejected = 0
      user_id = nil
      user_id = current_user.id if current_user

      if params[:memory_file][:category_id]
        @category_id = params[:memory_file][:category_id]
      else
        @category_id = nil
      end
      # TODO: Get company and category from the form.
      # if not present on the csv file, then 
      # "csv_file"=>{"company"=>"FRED2", "domain"=>"FRED1"}
      if params[:memory_file][:company_id]
        @company_id = params[:memory_file][:company_id]
      else
        @company_id = nil
      end
      
      hp = Hpricot::XML(file)

      hp.children.each do |txt|
        if txt.elem?
          # txt = hp.children[0] if hp.children[0].elem?
          cru = txt.at("CrU").children[0].to_s.strip
          crd = txt.at("CrD").children[0].to_s.strip
          seg = txt.at("Seg").to_s.split("\r\n")
          lang1=seg[0].match(/<.*?>/).to_s.gsub("<Seg L=\"","").gsub(/">/,"").gsub("-","_").to_s.strip.downcase
          lang2=seg[1].match(/<.*?>/).to_s.gsub("<Seg L=\"","").gsub(/">/,"").gsub("-","_").to_s.strip.downcase
          cont1=seg[0].gsub(/<.*?>/,"").gsub(/\{.*?\}/,"").gsub("\\tab","").gsub("\\~","").gsub("\\endash","").to_s.strip
          cont2=seg[1].gsub(/<.*?>/,"").gsub(/\{.*?\}/,"").gsub("\\tab","").gsub("\\~","").gsub("\\endash","").to_s.strip
          size1 = cont1.size
          size2 = cont2.size
          @source_language = Language.find_or_create_by_title(lang1)
          @target_language = Language.find_or_create_by_title(lang2)
          #unless (size1 < size2*1.5) or (size2 < size1*1.5)
          unless (cont1.empty?) or (cont2.empty?)
            Segment.create(
              :source_content => cont1,
              :target_content => cont2,
              :source_language_id => @source_language.id,
              :target_language_id => @target_language.id,
              :category_id => @category_id,
              :category_id => @company_id,
              :crd => crd,
              :cru => cru,
              :user_id => user_id,
              :raw_data => txt.to_s
            )
            logger.info(".")
            @total+=1
          else
            logger.info("-")
            @rejected+=1
          end
        end #end if elem?
      end #end for each tag
    
      flash[:success] = "#{@total} entries were successfully imported."
      flash[:success] << "<br />#{@rejected} were not import." if (@rejected>0)
      file.close
    else
      flash[:error] = "No File given"
    end
    redirect_to :action => "index"
  end
  
end
