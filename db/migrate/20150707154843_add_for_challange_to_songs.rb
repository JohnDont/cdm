class AddForChallangeToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :for_challenge, :integer, default: 0
  end
end
