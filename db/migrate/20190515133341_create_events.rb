class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :game, foreign_key: true
      t.datetime :date_time
      t.string :location
      t.string :game_owner

      t.timestamps
    end
  end
end
