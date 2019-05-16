class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :not_aceptable
    end
  end

  def friends
    user = User.find(params[:id])
    render json: user.friends
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar_url)
  end

end
