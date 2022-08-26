class CommentsController < ApplicationController
  authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(author: current_user, post_id: params[:post_id], text: post_params[:text])
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end
