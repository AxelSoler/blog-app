class Api::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user_id
    comment.post_id = params[:id]
    if comment.save
      render json: { message: 'Yes' }, status: :ok
    else
      render json: { message: 'no' }, status: :400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
  