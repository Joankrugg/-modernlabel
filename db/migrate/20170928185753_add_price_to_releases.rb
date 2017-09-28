class AddPriceToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :price, :integer
  end
end
