class AddAddressToAssos < ActiveRecord::Migration[5.0]
  def change
    add_column :assos, :address, :string
  end
end
