class Event < ApplicationRecord
  validates :game_id, presence: true
  validates :location, presence: true
  validates :date_time, presence: true
  validates :pending_attendees, presence:
    {message: ->(object, data) do
      "You must invite someone to the event"
    end
  }

  belongs_to :game, optional: true

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  has_many :event_invites, dependent: :destroy
  has_many :pending_attendees, through: :event_invites, source: :user

  def host
    self.attendances.find_by(host:true).user
  end

  def host=(user)
    Attendance.create(user_id: user.id, event_id: self.id, host: true)
  end

end
