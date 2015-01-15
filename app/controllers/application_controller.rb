class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize
  protect_from_forgery with: :exception

  helper_method :current_user

  private 

  def current_user
  	@current_user ||= User.where(id: session[:user_id]).first
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.try(:id).try(:to_s)
  end

  # session[:user_id] = User.where(id: session[user.try(:to_s)]).first

  def authorize
  	redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end