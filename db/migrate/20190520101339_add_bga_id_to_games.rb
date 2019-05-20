class AddBgaIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :bga_id, :string
  end
end
