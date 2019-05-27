class AddDefaultValueToAvatarUrl < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :avatar_url, :string, default: 'https://boardgamesper.files.wordpress.com/2018/06/blue-meeple.jpg?w=1400'
  end
end
