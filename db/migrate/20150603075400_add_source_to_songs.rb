class AddSourceToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :provider, :string
    add_column :songs, :provider_id, :string
    add_column :songs, :url, :string
  end
end
