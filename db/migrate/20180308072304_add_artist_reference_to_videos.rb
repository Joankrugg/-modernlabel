class AddArtistReferenceToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :artist, foreign_key: true
  end
end
