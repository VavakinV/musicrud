class AddOrderInReleaseToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :order_in_release, :integer
  end
end
