class AddArtistRefToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :artist, foreign_key: true
  end
end
