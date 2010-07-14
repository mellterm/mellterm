class Admin::TranslationsController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    @search = Translation.search(params[:search])
    conditions = nil
    if params[:categories] && !params[:categories].empty?
      cat_ids = params[:categories].join(" OR category_id = ")
      conditions = ["category_id = #{cat_ids}"]
    end
    @translations = @search.paginate(
      :conditions => conditions,
      :page => params[:page], 
      :per_page => 40,
      :include => [:source_language, :target_language, :company, :category]
    )
  end
  
  def show
    @translation = Translation.find(params[:id])
  end
  
  def new
    @translation = Translation.new
    @translation.user_id = current_user.id
  end
  
  def create
    @translation = Translation.new(params[:translation])
    @translation.user_id = current_user.id
    if @translation.save
      flash[:success] = "Successfully created translation."
      redirect_to admin_translations_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @translation = Translation.find(params[:id])
  end
  
  def update
    @translation = Translation.find(params[:id])
    if @translation.update_attributes(params[:translation])
      flash[:success] = "Successfully updated translation."
      redirect_to admin_translations_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if params[:all]
      Translation.destroy_all
      flash[:success] = "Successfully delete all Translations from database."
    else
      @translation = Translation.find(params[:id])
      @translation.destroy
      flash[:success] = "Successfully deleted translation."
    end
    redirect_to admin_translations_url
  end
  
  def import
    require "fastercsv"
    require 'tempfile'
    file = params[:csv_file][:file]
    file_type = `file -b --mime-encoding #{file.path}`.chomp.upcase
    # Only allow UTF-8 
    unless file_type.match("UTF-8")
      tmp_file = Tempfile.new("/tmp")
      flash[:notice] = "File was converted from #{file_type} to UTF-8"
      logger.debug "*** Found File encoding not UTF-8: #{file_type}"
      logger.debug "*** Converting from #{file_type} to UTF-8"
      logger.debug "    Command: iconv -f #{file_type} -t UTF-8 #{file.path} >> #{tmp_file.path}"
      # Create a new temp file to store the new converted file
      conversion = system("iconv -f #{file_type} -t UTF-8 #{file.path} >> #{tmp_file.path}")
      if conversion 
        logger.debug "*** Successfully converted"
        file.close!
        file = tmp_file
      end
    end
    
    arr_of_arrs = FasterCSV.read(file.path)
    # de_de, en_gb,category,company, notes
    @source_language = Language.find_or_create_by_title(arr_of_arrs[0][0].to_s)
    @target_language = Language.find_or_create_by_title(arr_of_arrs[0][1].to_s)
    arr_of_arrs.delete_at(0)
    @total = 0
    arr_of_arrs.each do |row|
      @source_content = row[0].to_s
      @target_content = row[1].to_s
      
      @source_content = @source_content.toutf8 unless @source_content.is_utf8?
      @target_content = @target_content.toutf8 unless @target_content.is_utf8?
      
      @category_id = nil
      @company_id = nil
      @category_id = Category.find_or_create_by_title(row[2].to_s).id unless row[2].to_s.blank?
      @company_id = Company.find_or_create_by_title(row[3].to_s) unless row[3].to_s.blank?
      @notes = row[4].to_s
      if (Translation.create( 
        :source_content => @source_content, 
        :target_content => @target_content, 
        :source_language_id => @source_language.id, 
        :target_language_id => @target_language.id,
        :category_id => @category_id,
        :company_id => @company_id,
        :notes => @notes)
        )
        @total+=1
      end
    end
    flash[:success] = "#{@total} entries were successfully imported."
    file.close!
    redirect_to :action => "index"
  end
  
end
