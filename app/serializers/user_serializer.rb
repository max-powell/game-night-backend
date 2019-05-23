class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :friend_requests, :event_invites
  has_many :games
  has_many :friends, serializer: FriendSerializer
  has_many :events, serializer: InviteEventSummarySerializer

  def friend_requests
    FriendRequest.where(friend: object).map do |r|
      ActiveModelSerializers::SerializableResource.new(r, {serializer: FriendRequestSerializer})
    end
  end

  def event_invites
    object.event_invites.map do |i|
      ActiveModelSerializers::SerializableResource.new(i, {serializer: EventInviteSerializer})
    end
  end

end
