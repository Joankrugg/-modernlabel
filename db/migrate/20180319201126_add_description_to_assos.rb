class AddDescriptionToAssos < ActiveRecord::Migration[5.0]
  def change
    add_column :assos, :description, :string
  end
end
