class AddDescriptionToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :description, :text
  end
end
