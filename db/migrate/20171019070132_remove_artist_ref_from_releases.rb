class RemoveArtistRefFromReleases < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :releases, column: :artist_id
    remove_column :releases, :artist_id, :integer
  end
end
