# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def multi_select(id, name, objects, selected_objects, value, content = {})
    options = ""
    objects.each do |o|
      selected = selected_objects.include?(o) ? " selected=\"selected\"" : ""
      option_value = escape_once(o.send(value))
      text = [option_value]
      unless content[:text].nil?
        text = []
        content[:text].each do |t|
          text << o.send(t)
        end
        text = text.join(" ")
      end
      bracket = []
      unless content[:bracket].nil?
        content[:bracket].each do |b|
          bracket << o.send(b)
        end
        bracket = bracket.join(" ")
      end
      option_content = bracket.empty? ? "#{text}" : "#{text} (#{bracket})"
      options << "<option value=\"#{option_value}\"#{selected}>#{option_content}</option>\n"
    end
    "<select multiple=\"multiple\" id=\"#{id}\" name=\"#{name}\">\n#{options}</select>"
  end
  
  def javascript_enabled?
    if session[:javascript_updated]
      logger.debug "* Javascript is enabled"
      true
    else
      logger.debug "* Javascript is disabled"
      false
    end
  end
  
  def meta_language
    lang = I18n.locale
    if lang.to_s.match("en")
      lang = "en, en-US"
    end
    lang
  end
  
  def show_admin_content?
    authorized?
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def authorized?
    logged_in? && current_user.admin?
  end

  def boolean_to_money_small(bol)
    if bol && (bol == true)
      return image_tag("/images/money32.png", :class => "align-center")
    else
      return image_tag("/images/free32.png", :class => "align-center")
    end
  end
  
  def boolean_to_money(bol)
    if bol && (bol == true)
      return image_tag("/images/money48.png", :class => "align-center")
    else
      return image_tag("/images/free.png", :class => "align-center")
    end
  end
  
  def boolean_to_image_lock(bol)
    if bol && (bol == true)
      return image_tag("/images/lock22.png", :class => "align-center")
    else
      return nil
    end
  end
  
  def boolean_to_image_small(bol)
    if bol
      return image_tag("/images/yes_small.png", :class => "align-center")
    else
      return image_tag("/images/no_small.png", :class => "align-center")
    end
  end
  
  
  def boolean_to_image_big(bol)
    if bol
      return image_tag("/images/yes.png", :class => "align-center")
    else
      return image_tag("/images/no.png", :class => "align-center")
    end
  end
  
  def boolean_to_word(bol)
    if bol 
      return "Yes"
    else
      return "No"
    end
  end
  
  def boolean_to_word_yes(bol)
    if bol 
      return "Yes"
    else
      return ""
    end
  end
  
  def boolean_to_word_no(bol)
    if bol 
      return ""
    else
      return "No"
    end
  end
  
  def years_array
    years = []
    Time.now.year.downto(1950) do |year|
      years << year.to_s
    end
    years
  end


  def f_to_dec(f, prec=2,sep='.')
    num = f.to_i.to_s
    dig = ((prec-(post=((f*(10**prec)).to_i%(10**prec)).to_s).size).times do post='0'+post end; post)
    return num+sep+dig
  end


  def to_file_size(num)
    case num.to_i
    when 0 
      return "0 byte"
    when 1..1024
      return "1K"
    when 1025..1048576
      kb = num/1024.0
      return "#{f_to_dec(kb)} Kb"
    when 1024577..1049165824
      kb = num/1024.0
      mb = kb / 1024.0
      return "#{f_to_dec(mb)} Mb"
    else
      kb = num/1024.0
      mb = kb / 1024.0
      gb = mb / 1024.0
      return "#{f_to_dec(gb)} Gb"
    end
  end
  
end
