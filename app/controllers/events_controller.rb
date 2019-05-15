class EventsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.events
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      Attendance.create(user_id: params[:user_id], event_id: event.id, host: true)
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
