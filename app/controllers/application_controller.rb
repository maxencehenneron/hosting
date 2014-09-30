class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception
  before_action :set_locale
  helper_method :current_user


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={}) # Automatically adds the language to the adress if not set
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

  def current_cart
    session[:cart_id] ||= Cart.create!.id
    return @current_cart ||= Cart.find(session[:cart_id])
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil? #TODO: Xavier: Translation of this alert
  end
end
