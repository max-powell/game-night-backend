class FriendRequestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user, serializer: InviteUserSerializer
end
