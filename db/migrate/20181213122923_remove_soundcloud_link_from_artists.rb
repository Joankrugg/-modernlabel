class RemoveSoundcloudLinkFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :soundcloud_link, :string
  end
end
