class EventsController < ApplicationController

  def index
    events = current_user.events.reject{|e| Time.parse(e.date_time) < Time.now }.sort{|a, b| Time.parse(a.date_time) <=> Time.parse(b.date_time)}
    render json: events
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      event.host = current_user
      render json: event
    else
      render json: {error: 'Please complete all fields to create an event'}
    end
  end

  private

  def event_params
    params.require(:event).permit(:game_id, :date_time, :location, :game_owner, attendee_ids: [])
  end

end
