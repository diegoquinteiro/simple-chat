class SessionsController < ApplicationController
  def create
  	return head :forbidden unless auth_hash
    user = User.find_or_create_from_auth_hash(auth_hash)
    
    return head :not_found unless user
    session[:current_user] = user.id

    redirect_to '/'
  end

  def logout
  	session[:current_user] = nil
    head :ok
  end

  def show
  	return head :forbidden unless params[:id] == "current" 
  	if session[:current_user].nil?
      head :not_found
    else
      render :json => { :session => { :id => "current", user_id: session[:current_user] }}
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end