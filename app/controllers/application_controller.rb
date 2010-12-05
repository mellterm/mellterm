# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  helper_method :current_user_session, :current_user, :is_company?
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  before_filter :get_settings, :set_categories_hash, :store_location, :setup_search, :order_by, :set_title, :set_user_session
  before_filter :get_locale
  layout 'application'
  
  rescue_from(ActionController::RoutingError, :with => :not_found) if Rails.env == "production"
  rescue_from(ActionController::UnknownAction, :with => :not_found) if Rails.env == "production"
  rescue_from(ActiveRecord::RecordNotFound, :with => :not_found) if Rails.env == "production"
  
  def on_windows?
    if RUBY_PLATFORM =~ /(:?mswin|win32|mingw|bccwin)/
      return true
    else
      return false
    end
  end
  
  def get_settings
    @editable_source = false
  end
  
  def set_user_session
    @user_session = UserSession.new unless current_user
    @title = "Login" if (controller_name == "user_session" && action_name == "new")
  end
  
  def set_title
    @title = "Home" if @title.nil?
  end
  
  def set_categories_hash
    @categories_hash = {}
    Category.all.each do |t| 
      @categories_hash[t.id.to_s] = t.title.to_s
    end
    @statuses_hash = {}
    Segment::STATUSES.each do |t|
      @statuses_hash[t]=t
    end
  end
  
  def order_by
    if session[:order_by]
      @order_by=session[:order_by]
    else
      @order_by="updated_at DESC"
    end
    @order_by
  end
  
  def not_found
    flash[:error] = "Page not found." 
    redirect_to root_path
  end
  
  # this search for global template
  # DO NOT REMOVE From here.
  def setup_search
    if current_user
      @segment_search = current_user.segments.search(params[:search])
      @terms_search = current_user.translations.search(params[:search])
    else
      @terms_search = nil
      @segment_search = nil
    end
  end
  
  # Check for iphone/ipod devices, Nokia, Android
  def is_iphone_request?
    request.user_agent.downcase =~ /(mobile\/.+safari)|(iphone)|(ipod)|(blackberry)|(symbian)|(series60)|(android)|(smartphone)|(wap)|(mobile)/
  end

  def set_iphone_format
    if params[:desktop]
      session[:mobile] = nil
    end
    if is_iphone_request? or params[:mobile] or session[:mobile]
      session[:desktop] = nil
      session[:mobile] = true
      request.format = :iphone
    end
  end
    
  def initialize
    @start_time = Time.now.usec
  end
  
  def logged_in?
    !current_user.nil?
  end

  def authorized?
    logged_in? && current_user.admin?
  end

  def authorized_only
    redirect_to new_user_session_path unless authorized?
  end

  ##################
  # LOCALE METHODS #
  ##################
  
  def default_language
    "pt-BR"
  end
  
  def get_locale
    logger.debug "*** Language from Browser Locale : #{extract_locale_from_accept_language_header}"
    if !params[:language] && !session[:language]
      session[:language] = extract_locale_from_accept_language_header
      logger.debug "*** Using Language from Browser Locale: #{extract_locale_from_accept_language_header}"
    elsif (params[:language] && params[:language].to_s.match(/en_us|de_de/))
      logger.debug "*** session[:language] was: '#{session[:language]}'"
      logger.debug "*** new session[:language] = params[:language] : '#{params[:language]}'"
      session[:language] = params[:language]
    elsif RAILS_ENV == "test"
      session[:language] = "en"
    else
      session[:language] = get_locale_from_session
    end
    set_locale
  end
  
  # retrieve the language from the session store, 
  # otherwise set to default of pt-BR
  def get_locale_from_session
    if (session && session[:language])
      logger.debug "*** Language from Session '#{session[:language]}'"
      lang = session[:language]
    else
      lang = default_language
    end
    lang
  end
  
  
  def set_locale
    if session[:language]
      set_locale_to(session[:language])
    else
      lang = extract_locale_from_accept_language_header
      set_locale_to(lang)
    end
  end
  
  def set_locale_to(lang)
    I18n.locale = lang
    logger.debug "*** Locale set to '#{I18n.locale}'"
    logger.debug "*** session[:language] is '#{session[:language]}'"
  end

  def is_company?
    return true if current_user.user_type_id == 3
    return false
  end


  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end
    
    def require_admin
      unless current_user && current_user.admin?
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
      end
    end

    def store_location
      if params[:return_to]
        session[:return_to] = params[:return_to]
      else
        session[:return_to] = request.request_uri
      end
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def extract_locale_from_accept_language_header
      if request.env['HTTP_ACCEPT_LANGUAGE'] && !request.env['HTTP_ACCEPT_LANGUAGE'].empty?
        lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
        lang = nil if lang.empty?
      end
      return lang
    end
end
