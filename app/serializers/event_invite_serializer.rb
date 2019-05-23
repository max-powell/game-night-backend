class EventInviteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user, serializer: InviteUserSerializer
  has_one :event
end
