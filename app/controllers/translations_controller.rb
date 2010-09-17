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
    @translation = Translation.find(params[:id])
    @seg_search = Segment.source_content_like(@translation.source_content)
    @segments = @seg_search.all
  end
    
end
