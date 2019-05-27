class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: [:update, :destroy]

  def index
    incoming = FriendRequest.where(friend: current_user)
    render json: incoming
  end

  def create
    request = current_user.friend_requests.create(friend_id: friend_request_params[:friend_id])
    if request.valid?
      render json: ActiveModelSerializers::SerializableResource.new(request.friend, {serializer: FriendSerializer}).as_json
    else
      render json: {error: request.errors.full_messages}
    end
  end

  def update
    friend = @friend_request.user
    @friend_request.accept
    render json: ActiveModelSerializers::SerializableResource.new(friend, {serializer: FriendSerializer}).as_json
  end

  def destroy
    @friend_request.destroy
    render json: {message: 'Friend request declined'}
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:friend_id)
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

end
