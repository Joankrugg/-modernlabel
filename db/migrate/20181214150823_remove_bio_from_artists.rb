class RemoveBioFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :bio, :string
  end
end
