class InviteEventSummarySerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :host, :game

  def game
    object.game ? object.game.name : 'TBD'
  end

  def host
    ActiveModelSerializers::SerializableResource.new(object.host, {serializer: InviteUserSerializer})
  end
end
