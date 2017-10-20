class AddPlaceAddressToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :place_address, :string, default: nil
  end
end
