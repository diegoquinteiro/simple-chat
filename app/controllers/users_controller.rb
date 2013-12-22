class UsersController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def show
    respond_with User.find(params[:id])
  end
end