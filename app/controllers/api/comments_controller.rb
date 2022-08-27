class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    comment = Comment.new(author: current_user, post_id: params[:post_id], text: comment_params[:text])
    if comment.save
      render json: { message: 'comment sent' }, status: :ok
    else
      render json: { message: 'there has been a problem' }, status: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
