class Admin::TranslationsController < Admin::BaseController
  
  before_filter :require_admin
  
  def index
    # @search = Translation.search(params[:search])
    conditions = nil
    if params[:categories] && !params[:categories].empty?
      # cat_ids = params[:categories].join(" OR category_id = ")
      # conditions = ["category_id = #{cat_ids}"]
      ids = []
      params[:categories].each {|t| ids << t.to_i}
      @search = Translation.categories_id_equals(ids).search(params[:search])
    else
      @search = Translation.search(params[:search])
    end
    
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @search = @category.translations.search
    end
    
    @translations = @search.paginate(
      :select => "distinct `translations`.*",
      # :conditions => conditions, 
      :page => params[:page], 
      :per_page => 40,
      :include => [:source_language, :target_language, :company, :categories, :user]
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
    params[:translation][:category_ids] ||= []
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
    if params[:csv_file][:file]
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
    
      # TODO: Get company and category from the form.
      # if not present on the csv file, then 
      # "csv_file"=>{"company"=>"FRED2", "domain"=>"FRED1"}
      if params[:csv_file][:company_id]
        @bypass_company_id = params[:csv_file][:company_id]
      else
        @bypass_company_id = nil
      end
      
      if params[:csv_file][:category_ids]
        @bypass_category_ids = params[:csv_file][:category_ids]
      else
        @bypass_category_ids = nil
      end
      
      @bypass_user_id = nil
      @company_count_start = Company.count
      @category_count_start = Category.count
    
      arr_of_arrs.each do |row|
        @source_content = row[0].to_s
        @target_content = row[1].to_s
      
        @source_content = @source_content.toutf8 unless @source_content.is_utf8?
        @target_content = @target_content.toutf8 unless @target_content.is_utf8?
      
        # will look for the categories on the CSV file.
        # if they are there, ignore the one from the form. 
        categories = row[2].to_s.split(",")
        unless categories.empty?
          @csv_categories = []
          categories.each do |t|
            cat = Category.find_or_create_by_title(t)
            @csv_categories << cat.id if cat
          end
        else
          @csv_categories = @bypass_category_ids
        end
      
        # will look for the company on the CSV file
        # if not found on the database, then create it.
        company = row[3].to_s
        if company.empty?
          @company_id = @bypass_company_id
        else
          @company = Company.find_or_create_by_title(company)
          @company_id = @company.id if @company
        end
      
        user_id = nil
        if @bypass_user_id
          user_id = @bypass_user_id
        else
          user_id = current_user.id if current_user
        end
      
        # @category_id = Category.find_or_create_by_title(row[2].to_s).id unless row[2].to_s.blank?
        # @company_id = Company.find_or_create_by_title(row[3].to_s) unless row[3].to_s.blank?
      
        @notes = row[4].to_s
        if (@tr = Translation.create(
            :source_content => @source_content,
            :target_content => @target_content,
            :source_language_id => @source_language.id,
            :target_language_id => @target_language.id,
            :company_id => @company_id,
            :notes => @notes,
            :user_id => user_id)
          )
          @total+=1
          @tr.category_ids = @csv_categories
        end
      end
      @company_count = Company.count-@category_count_start
      @category_count = Category.count-@category_count_start
    
      flash[:success] = "#{@total} entries were successfully imported."
      flash[:success] << "<br />#{@category_count} new domains were created." if (@category_count>0)
      flash[:success] << "<br />#{@company_count} new companies were created." if (@company_count>0)
      file.close!
    else
      flash[:error] = "No CSV File was given"
    end
    redirect_to :action => "index"
  end
  
end
