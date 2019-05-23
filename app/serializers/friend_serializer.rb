class FriendSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :game_count

  def game_count
    object.games.count
  end
end
