class AddCountyRefToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :county, foreign_key: true
  end
end
