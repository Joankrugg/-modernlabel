class RemoveColumnArtistIdFromPerformances < ActiveRecord::Migration[5.0]
  def change
    remove_column :performances, :artist_id, :integer
  end
end
