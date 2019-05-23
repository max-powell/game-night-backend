class EventInviteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :event, serializer: InviteEventSummarySerializer
end
