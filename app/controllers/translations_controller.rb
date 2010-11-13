class TranslationsController < ApplicationController
  before_filter :require_user
  
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
    @translations = @search.paginate(
      :select => "distinct `translations`.*",
      # :conditions => conditions, 
      :page => params[:page], 
      :per_page => 40,
      :include => [:source_language, :target_language, :company, :categories, :user]
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
      redirect_to admin_translations_url
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
  
    
end
