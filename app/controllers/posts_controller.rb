class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(:id)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(:id)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(author: current_user, title: post_params[:title], text: post_params[:text])
    if @post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
