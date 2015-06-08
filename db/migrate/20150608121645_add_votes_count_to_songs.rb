class AddVotesCountToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :votes_count, :integer, default: 0
  end
end
