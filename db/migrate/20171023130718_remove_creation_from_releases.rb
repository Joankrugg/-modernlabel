class RemoveCreationFromReleases < ActiveRecord::Migration[5.0]
  def change
    remove_column :releases, :creation, :date
  end
end
