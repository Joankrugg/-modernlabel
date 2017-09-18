class AddProductToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :product, :string
  end
end
