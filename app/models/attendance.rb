class Attendance < ApplicationRecord
  after_destroy :destroy_event_if_host

  validates :event, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :event

  def destroy_event_if_host
    self.event.destroy if self.host
  end

end
