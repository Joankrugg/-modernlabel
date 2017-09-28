class AddEditionToActus < ActiveRecord::Migration[5.0]
  def change
    add_column :actus, :edition, :date
  end
end
