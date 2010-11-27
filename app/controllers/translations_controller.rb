class TranslationsController < ApplicationController
  before_filter :require_user
  
  def index

    conditions = ["translations.user_id = ?", current_user.id]
    if params[:categories] && !params[:categories].empty?
      # cat_ids = params[:categories].join(" OR category_id = ")
      # conditions = ["category_id = #{cat_ids}"]
      ids = []
      params[:categories].each {|t| ids << t.to_i}
      @terms_search = current_user.translations.categories_id_equals(ids).search(params[:search])
    else
      @terms_search = current_user.translations.search(params[:search])
    end
    @translations = @terms_search.paginate(
      :select => "distinct `translations`.*",
      # :conditions => conditions, 
      :page => params[:page], 
      :per_page => 25,
      :include => [:source_language, :target_language, :company, :categories, :user]
    )

    if params[:categories] && !params[:categories].empty?
      cat_ids = params[:categories].join(" OR category_id = ")
      conditions = ["category_id = #{cat_ids}"]
      # ids = []
      # params[:categories].each {|t| ids << t.to_i}
      # @search = Segment.categories_id_equals(ids).search(params[:search])
    else
      @segment_search = current_user.segments.search(params[:search])
    end
    @segments = @segment_search.paginate(
      # :select => "distinct `segments`.*",
      # :conditions => conditions, 
      :page => params[:page], 
      :per_page => 25,
      :order => "segments.id ASC",
      :include => [:source_language, :target_language, :category, :user]
    )
    
  end
  
  def show
    @translation = current_user.translations.find(params[:id])
    @segments = @translation.matching_segments
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
      redirect_to @translation
    else
      render :action => 'new'
    end
  end
  
  def edit
    @translation = current_user.translations.find(params[:id])
  end
  
  def update
    params[:translation][:category_ids] ||= []
    @translation = current_user.translations.find(params[:id])
    if @translation.update_attributes(params[:translation].merge(:updated_by => current_user))
      flash[:success] = "Successfully updated translation."
      redirect_to @translation
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
    redirect_to translations_path
  end
  
    
end
