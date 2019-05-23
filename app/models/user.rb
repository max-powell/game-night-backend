class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :ownerships, dependent: :destroy
  has_many :games, through: :ownerships

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
end
