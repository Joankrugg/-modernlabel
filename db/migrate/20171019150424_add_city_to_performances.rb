class AddCityToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :city, :string, default: nil
  end
end
