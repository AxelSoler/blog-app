class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(:id)
    render json: @posts
  end
end
  