class AddGenreReferenceToArtists < ActiveRecord::Migration[5.0]
  def change
    add_reference :artists, :genre, foreign_key: true
  end
end
