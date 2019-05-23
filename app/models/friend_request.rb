class FriendRequest < ApplicationRecord
  validate :friend_not_self
  validates :friend, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :friend,  class_name: 'User'

  def accept
    user.friends << friend
    destroy
  end

  private

  def friend_not_self
    errors.add(:friend, "can't be user") if self.user == self.friend
  end

end
