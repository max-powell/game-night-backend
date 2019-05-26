class Mechanic < ApplicationRecord
  has_many :game_mechanics, dependent: :destroy
  has_many :games, through: :game_mechanics
end
