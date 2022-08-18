class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  # def create
  #   @comment = Comment.new(author: current_user, text: post_params[:text])
  #   if @comment.save
  #     redirect_to user_posts_path
  #   else
  #     render :new
  #   end
  # end

  # private
  # def post_params
  #   params.require(:comment).permit(:text)
  # end
end