class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players, default: 0
      t.integer :max_players, default: 0
      t.integer :min_playtime, default: 0
      t.integer :max_playtime, default: 0
      t.string :description, default: 'Description unavailable'
      t.string :image_url

      t.timestamps
    end
  end
end
