class UsersController < ApplicationController
  skip_before_action :authorised, only: :create

  def profile
    render json: current_user, status: :accepted
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: {user: UserSerializer.new(user), jwt: token}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def friends
    render json: current_user.friends
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :avatar_url)
  end

end
