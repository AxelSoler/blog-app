class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.likes.new(post_id: params[:post_id])
    redirect_to request.referrer if @user.save
  end
end
