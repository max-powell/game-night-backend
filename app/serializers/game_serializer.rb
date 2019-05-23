class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :min_players, :max_players, :min_playtime, :max_playtime, :description, :image_url, :bga_id, :host
end
