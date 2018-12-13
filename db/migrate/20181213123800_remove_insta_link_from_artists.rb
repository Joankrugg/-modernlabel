class RemoveInstaLinkFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :insta_link, :string
  end
end
