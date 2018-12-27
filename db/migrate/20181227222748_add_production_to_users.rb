class AddProductionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :production, :boolean, default: false
  end
end
