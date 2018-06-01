class AddNumberOfMusiciansMaxToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :number_of_musicians_max, :integer, default: 4
  end
end
