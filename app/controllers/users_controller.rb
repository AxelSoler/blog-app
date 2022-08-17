class UsersController < ApplicationController
  def index
    @people = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end
end
