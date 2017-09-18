class RemoveTypeFromReleases < ActiveRecord::Migration[5.0]
  def change
    remove_column :releases, :type, :integer
  end
end
