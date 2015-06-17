class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :song, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    remove_column :songs, :plays

    add_column :users, :plays_count, :integer, default: 0
    add_column :songs, :plays_count, :integer, default: 0
  end
end
