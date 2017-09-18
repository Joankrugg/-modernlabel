class RemoveProductFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :product, :integer
  end
end
