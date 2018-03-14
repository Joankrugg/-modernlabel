class AddPlaceReferenceToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :place, foreign_key: true
  end
end
