class Friendship < ApplicationRecord
  validate :friend_not_self
  validates :friend, uniqueness: {scope: :user}

  after_create :create_reciprocal_friendship
  after_destroy :destroy_reciprocal_friendship

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  private

  def friend_not_self
    errors.add(:friend, "can't be user") if self.user == self.friend
  end

  def create_reciprocal_friendship
    self.friend.friends << self.user
  end

  def destroy_reciprocal_friendship
    friendship = self.friend.friendships.find_by(friend: self.user)
    friendship.destroy if friendship
  end
end
