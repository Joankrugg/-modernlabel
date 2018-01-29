class AddDescriptionToActus < ActiveRecord::Migration[5.0]
  def change
    add_column :actus, :description, :string
  end
end
