class PagesController < ApplicationController
  
  def show
    @page = Page.first
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
    end
    if params[:id]
      @page = Page.find(params[:id])
    end
    @title = @page.title
  end
  
end
