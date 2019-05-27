class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :friend_requests, :sent_friend_requests, :event_invites, :events
  has_many :games
  has_many :friends, serializer: FriendSerializer

  def events
    events = object.events.reject{|e| Time.parse(e.date_time) < Time.now }.sort{|a, b| Time.parse(a.date_time) <=> Time.parse(b.date_time)}
    events.map do |e|
      ActiveModelSerializers::SerializableResource.new(e, {serializer: InviteEventSummarySerializer})
    end
  end

  def sent_friend_requests
    object.friend_requests.map do |fR|
      ActiveModelSerializers::SerializableResource.new(fR, {serializer: PendingFriendsSerializer})
    end
  end

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
