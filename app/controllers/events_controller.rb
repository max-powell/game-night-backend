class EventsController < ApplicationController

  def index
    render json: current_user.events
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      event.host = current_user
      render json: ActiveModelSerializers::SerializableResource.new(event, {serializer: InviteEventSummarySerializer}).as_json
    else
      render json: {error: event.errors.full_messages}
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    if event.valid?
      render json: ActiveModelSerializers::SerializableResource.new(event, {serializer: InviteEventSummarySerializer}).as_json
    else
      render json: {error: event.errors.full_messages}
    end
  end

  private

  def event_params
    params.require(:event).permit(:game_id, :date_time, :location, :game_owner, :invited_guest_ids => [])
  end

end
