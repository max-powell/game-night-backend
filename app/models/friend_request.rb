class FriendRequest < ApplicationRecord
  validate :friend_not_self
  validates :friend, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :friend,  class_name: 'User'

  private

  def friend_not_self
    errors.add(:friend, "can't be user") if self.user == self.friend
  end

end
