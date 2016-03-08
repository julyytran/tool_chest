class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
