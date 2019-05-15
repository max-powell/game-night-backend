class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  has_many :ownerships, dependent: :destroy
  has_many :games, through: :ownerships
end
