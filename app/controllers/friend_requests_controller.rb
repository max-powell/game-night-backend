class FriendRequestsController < ApplicationController
  before_action :set_request, only: [:update, :destroy]

  def index
    incoming = FriendRequest.where(friend: current_user)
    render json: incoming
  end

  def create
    request = current_user.friend_requests.create(friend_id: friend_request_params[:friend_id])
    if request.valid?
      render json: request.friend
    else
      render json: {error: request.errors.full_messages}
    end
  end

  def update
    request.accept
    render json: request.friend
  end

  def destroy
    friend_request.destroy
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:friend_id)
  end

  def set_request
    request = FriendRequest.find(params[:id])
  end

end
