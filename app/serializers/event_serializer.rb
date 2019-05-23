class EventSerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :game, :game_owner
  has_many :invited_guests, serializer: InviteUserSerializer

end
