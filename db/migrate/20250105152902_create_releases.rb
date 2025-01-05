class CreateReleases < ActiveRecord::Migration[8.0]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :type
      t.date :date_of_release
      t.string :genre
      t.string :language
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
