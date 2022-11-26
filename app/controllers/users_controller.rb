class UsersController < ApplicationController
  before_action :find_user, only: %i(edit update)

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end
end
