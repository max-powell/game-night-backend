class EventInvitesController < ApplicationController
  before_action :set_event_invite, only: [:update, :destroy]

  def index
    render json: current_user.event_invites
  end

  def create
    event_invite = EventInvite.create(user_id: event_invite_params[:user_id], event_id: event_invite_params[:event_id])
    if event_invite.valid?
      render json: {message: 'Invite sent'}
    else
      render json: {error: event_invite.errors.full_messages}
    end
  end

  def update
    @event_invite.accept
    render json: @event_invite.event
  end

  def destroy
    @event_invite.destroy
    render json: {message: 'Event invite declined'}
  end

  private

  def event_invite_params
    params.require(:event_invite).permit(:event_id, :user_id)
  end

  def set_event_invite
    @event_invite = EventInvite.find(params[:id])
  end

end
