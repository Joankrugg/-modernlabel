class AddCountyRefToAssos < ActiveRecord::Migration[5.0]
  def change
    add_reference :assos, :county, foreign_key: true
  end
end
