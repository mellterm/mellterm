class TranslationsController < ApplicationController
  before_filter :require_user
  
  def index
    conditions = nil
    if params[:categories] && !params[:categories].empty?
      cat_ids = params[:categories].join(" OR category_id = ")
      conditions = ["category_id = #{cat_ids}"]
    end
    @translations = @search.paginate(
      :page => params[:page],
      :per_page => 40,
      :conditions => conditions, 
      :include => [:source_language, :target_language, :company, :category]
    )
  end
  
  def show
    @translation = Translation.find(params[:id])
  end
    
end
