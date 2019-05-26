class CreateMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :bga_id
      t.integer :agg_score, default: 0

      t.timestamps
    end
  end
end
