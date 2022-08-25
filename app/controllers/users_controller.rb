class UsersController < ApplicationController
  def index
    redirect_to new_user_session_path if current_user.nil?
    @people = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end
end
