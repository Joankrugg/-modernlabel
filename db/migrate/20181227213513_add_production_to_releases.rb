class AddProductionToReleases < ActiveRecord::Migration[5.0]
  def change
     add_column :releases, :production, :boolean, default: false
  end
end
