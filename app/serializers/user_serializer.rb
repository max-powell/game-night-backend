class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url
  has_many :games
  has_many :friends, serializer: FriendSerializer
  has_many :events, serializer: InviteEventSummarySerializer


end
