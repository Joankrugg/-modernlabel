class AddBillboardToActus < ActiveRecord::Migration[5.0]
  def change
    add_column :actus, :billboard, :boolean
  end
end
