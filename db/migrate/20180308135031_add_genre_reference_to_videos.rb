class AddGenreReferenceToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :genre, foreign_key: true
  end
end
