class Event < ApplicationRecord
  validates :game_owner, presence: true, unless: Proc.new { |e| e.game_id.blank? }

  belongs_to :game, optional: true

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

end
