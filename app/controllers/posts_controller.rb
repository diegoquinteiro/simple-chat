class PostsController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def index
    respond_with Post.order("created_at DESC").limit(100)
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    params = post_params
    params[:user_id] = 1
    respond_with Post.create(params)
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end