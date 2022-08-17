class UsersController < ApplicationController
  def index
    @people = User.all.order(:id)
  end

  def show; end
end
