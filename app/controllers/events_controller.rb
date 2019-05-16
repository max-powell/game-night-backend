class EventsController < ApplicationController

  def index
    render json: current_user.events
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      event.host = current_user
      render json: event
    else
      render json: {error: event.errors.full_messages}
    end
  end

  private

  def event_params
    params.require(:event).permit(:game_id, :date_time, :location, :game_owner, attendee_ids: [])
  end

end
