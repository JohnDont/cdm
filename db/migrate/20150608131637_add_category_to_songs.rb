class AddCategoryToSongs < ActiveRecord::Migration
  def change
    add_reference :songs, :category, index: true, foreign_key: true
  end
end
