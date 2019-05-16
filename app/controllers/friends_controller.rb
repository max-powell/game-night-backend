class FriendsController < ApplicationController

  def index
    render json: current_user.friends
  end

  def add_friend
    friend = User.find(friend_params[:id])
    current_user.friends << friend
    render json: friend
  end

  private

  def friend_params
    params.require(:friend).permit(:id)
  end

end
