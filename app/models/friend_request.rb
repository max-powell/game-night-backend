class FriendRequest < ApplicationRecord
  validate :friend_not_self, :not_already_friend
  validates :friend, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :friend,  class_name: 'User'

  def accept
    self.user.friends << self.friend
    destroy
  end

  private

  def friend_not_self
    errors.add(:friend, "can't be user") if self.user == self.friend
  end

  def not_already_friend
    errors.add(:friend, "can't already be a friend") if self.user.friends.include?(self.friend)
  end

end
