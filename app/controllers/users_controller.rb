class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user
    else
      render json: {error: user.errors.full_messages}
    end
  end

  def friends
    byebug
    user = User.find(params[:id])
    render json: user.friends
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar_url)
  end

end
