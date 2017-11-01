class AddNameToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :name, :string, default: nil
  end
end
