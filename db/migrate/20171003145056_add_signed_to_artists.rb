class AddSignedToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :signed, :boolean, default: false
  end
end
