class EventSerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :game, :game_owner

end
