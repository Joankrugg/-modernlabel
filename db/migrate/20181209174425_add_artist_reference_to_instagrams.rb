class AddArtistReferenceToInstagrams < ActiveRecord::Migration[5.0]
  def change
    add_reference :instagrams, :artist, foreign_key: true
  end
end
