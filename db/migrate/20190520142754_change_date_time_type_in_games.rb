class ChangeDateTimeTypeInGames < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :date_time, :text
  end
end
