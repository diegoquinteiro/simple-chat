class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
  	not session[:current_user].nil?
  end

  def current_user
    return nil unless session[:current_user]
  	User.find session[:current_user]
  end

  def authenticate_user!
  	return head :forbidden unless user_signed_in?
  end

end
