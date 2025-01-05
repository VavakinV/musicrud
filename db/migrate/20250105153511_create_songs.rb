class CreateSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :length
      t.references :release, null: false, foreign_key: true

      t.timestamps
    end
  end
end
