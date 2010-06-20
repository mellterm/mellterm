module Admin::BaseHelper
    
  def show_field(label, field, options = {})
    "<div class=\"label_field\">
  		<div class=\"label\">#{label}</div>
      <div class=\"value\">#{field}</div>
    </div>"
  end
  
  def asc_desc_helper
    if params[:order] && params[:order].match("ASC")
      result = "DESC"
    else
      result = "ASC"
    end
    if params[:order] && params[:order].match("DESC")
      result = "ASC"
    else
      result = "DESC"
    end
    return result
  end
  
  def sort_link_helper(title,name=nil)
    name ||= title.downcase
    link_to(title, :params => params.merge({:sort => name, :order => asc_desc_helper}) )
  end
  
  def ajax_spinner(spinner="spinner.gif")
    "<div id='spinner'> <img src='/images/#{spinner}' class='spinner' style='display:none;'> </div>"
  end
    
  def is_current_menu(name)
    if controller.controller_name == name
      return "current"
    end
  end
  
end
