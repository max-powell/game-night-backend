class Game < ApplicationRecord
  validates :name, presence: true

  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships, source: :user

  has_many :game_mechanics, dependent: :destroy
  has_many :mechanics, through: :game_mechanics
end
