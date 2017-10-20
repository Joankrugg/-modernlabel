class AddPriceToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :price, :integer, default: nil
  end
end
