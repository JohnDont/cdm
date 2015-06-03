class AddSongsDefaultPlayValue < ActiveRecord::Migration
  def change
    change_column :songs, :plays, :integer, default: 0
  end
end
