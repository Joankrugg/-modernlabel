class AddNumberOfMusiciansMaxToAssos < ActiveRecord::Migration[5.0]
  def change
    add_column :assos, :number_of_musicians_max, :integer, default: 9
  end
end
