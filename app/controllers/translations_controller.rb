class TranslationsController < ApplicationController
  def index
    @translations = Translation.all
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
      flash[:notice] = "Successfully created translation."
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
      flash[:notice] = "Successfully updated translation."
      redirect_to @translation
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @translation = Translation.find(params[:id])
    @translation.destroy
    flash[:notice] = "Successfully destroyed translation."
    redirect_to translations_url
  end
end
