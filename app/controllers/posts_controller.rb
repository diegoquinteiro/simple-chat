class PostsController < ApplicationController
  respond_to :json # default to Active Model Serializers
  def index
    respond_with Post.order("created_at DESC").limit(100)
  end

  def create
    respond_with Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end