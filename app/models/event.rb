class Event < ApplicationRecord
  validates :game_owner, presence: true, unless: Proc.new { |e| e.game_id.blank? }

  belongs_to :game, optional: true

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  def host
    self.attendances.find_by(host:true).user
  end

  def host=(user)
    Attendance.create(user_id: user.id, event_id: self.id, host: true)
  end

end
