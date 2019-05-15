class Game < ApplicationRecord
  validates :name, presence: true

  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships, source: :user
end
