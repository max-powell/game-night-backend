class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :game_count, :friend_count

  def game_count
    object.games.count
  end

  def friend_count
    object.friends.count
  end

end
