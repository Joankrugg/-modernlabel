class AddSoundcloudLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :soundcloud_link, :string, default: nil
  end
end
