class EventsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.events
  end

  private

  def event_params
    params.require(:event).permit(:game_id, :date_time, :location, :game_owner, attendee_ids: [])
  end

end
