class InviteEventSummarySerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :host, :game

  def game
    object.game.name
  end

  def host
    ActiveModelSerializers::SerializableResource.new(object.host, {serializer: InviteUserSerializer})
  end
end
