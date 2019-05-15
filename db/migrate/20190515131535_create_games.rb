class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
