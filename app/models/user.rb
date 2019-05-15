class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :ownerships, dependent: :destroy
  has_many :games, through: :ownerships

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
end
