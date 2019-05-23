class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :min_players, :max_players, :min_playtime, :max_playtime, :image_url, :bga_id
end
