class InviteEventSummarySerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :host

  def host
    ActiveModelSerializers::SerializableResource.new(object.host, {serializer: InviteUserSerializer})
  end
end
