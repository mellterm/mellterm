class TranslationsController < ApplicationController
  def index
    @search = Translation.search(params[:search])
    @translations = @search.all
  end
  
  def show
    @translation = Translation.find(params[:id])
  end
  
  def new
    @translation = Translation.new
  end
  
  def create
    @translation = Translation.new(params[:translation])
    if @translation.save
      flash[:success] = "Successfully created translation."
      redirect_to @translation
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
    redirect_to translations_url
  end
  
  def import
    require "fastercsv"
    file = params[:csv_file][:file]
    arr_of_arrs = FasterCSV.read(file.path)
    @source_language = Language.find(:first, :conditions => ["title = ?", arr_of_arrs[0][0].to_s])
    @target_language = Language.find(:first, :conditions => ["title = ?", arr_of_arrs[0][1].to_s])
    arr_of_arrs.delete_at(0)
    @total = 0
    arr_of_arrs.each do |row|
      if (Translation.create( :source_content => row[0], :target_content => row[1], 
        :source_language_id => @source_language.id, :target_language_id => @target_language.id))
        @total+=1
      end
    end
    flash[:success] = "#{@total} entries were imported."
    redirect_to :action => "index"
  end
  
end
