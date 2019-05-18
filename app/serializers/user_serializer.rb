class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :game_count, :friends

  def game_count
    object.games.count
  end

  def friend_count
    object.friends.count
  end

end
