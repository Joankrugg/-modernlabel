class AddYearOfCreationToAssos < ActiveRecord::Migration[5.0]
  def change
    add_column :assos, :year_of_creation, :integer
  end
end
