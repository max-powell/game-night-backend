class Attendance < ApplicationRecord
  validates :event, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :event
end
