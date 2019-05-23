class EventInvite < ApplicationRecord
  validates :event, uniqueness: {scope: :user}
  validate :not_already_attending

  belongs_to :user
  belongs_to :event

  def accept
    self.event.attendees << self.user
    destroy
  end

  private

  def not_already_attending
    errors.add(:user, "can't already be attending") if self.event.attendees.include?(self.user)
  end
end
