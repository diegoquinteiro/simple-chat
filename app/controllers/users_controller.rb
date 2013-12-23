class UsersController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def show
  	user = User.find(params[:id])
  	if session[:current_user] and user.id == session[:current_user]
  		user.current = true
  	else
  		user.current = false
  	end
    respond_with user
  end
end