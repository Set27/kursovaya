class UsersController < ApplicationController
  before_action :find_user, only: %i(edit update)

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(role_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def role_params
    params.require(:user).permit(:role)
  end
end
