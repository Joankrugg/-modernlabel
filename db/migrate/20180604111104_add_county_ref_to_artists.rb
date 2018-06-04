class AddCountyRefToArtists < ActiveRecord::Migration[5.0]
  def change
    add_reference :artists, :county, foreign_key: true
  end
end
