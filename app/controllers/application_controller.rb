class ApplicationController < ActionController::Base
  before_action :set_locale
  
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  


  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end