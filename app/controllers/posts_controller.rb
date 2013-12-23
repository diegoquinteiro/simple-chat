class PostsController < ApplicationController
  caches_action :index, :cache_path => Proc.new { |c| c.params }
  before_filter :authenticate_user!, :only => [:create]

  respond_to :json # default to Active Model Serializers
  def index
    if params[:last_requested]
      expires_in 2.second, :public => true, :must_revalidate => false
      respond_with Post.order("created_at DESC").where('created_at > ?', params[:last_requested])
    else
      respond_with Post.order("created_at DESC").limit(100)
    end
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    params = post_params
    params[:user_id] = current_user.id
    respond_with Post.create(params)
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end