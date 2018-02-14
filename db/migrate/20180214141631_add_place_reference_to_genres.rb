class AddPlaceReferenceToGenres < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :genre, foreign_key: true
  end
end
