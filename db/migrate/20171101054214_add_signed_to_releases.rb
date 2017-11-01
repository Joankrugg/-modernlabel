class AddSignedToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :signed, :boolean, default: false
  end
end
