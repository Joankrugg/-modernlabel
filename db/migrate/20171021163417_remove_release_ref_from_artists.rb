class RemoveReleaseRefFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :artists, column: :release_id
    remove_column :artists, :release_id, :integer
  end
end
