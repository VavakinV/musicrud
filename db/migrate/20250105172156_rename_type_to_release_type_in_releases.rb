class RenameTypeToReleaseTypeInReleases < ActiveRecord::Migration[8.0]
  def change
    rename_column :releases, :type, :release_type
  end
end
