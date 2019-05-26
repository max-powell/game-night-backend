class CreateGameMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :game_mechanics do |t|
      t.references :game, foreign_key: true
      t.references :mechanic, foreign_key: true

      t.timestamps
    end
  end
end
