class EventSerializer < ActiveModel::Serializer
  attributes :id, :date_time, :location, :host?, :available_games
  belongs_to :game
  has_many :attendees, serializer: InviteUserSerializer
  has_many :invited_guests, serializer: InviteUserSerializer

  def host?
    object.host.id == current_user.id
  end

  def available_games
    object.attendees.map(&:games).flatten
  end

end
