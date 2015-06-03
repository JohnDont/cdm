class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :image
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.integer :plays

      t.timestamps null: false
    end
  end
end
