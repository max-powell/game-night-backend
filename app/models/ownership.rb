class Ownership < ApplicationRecord
  validates :game, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :game
end
