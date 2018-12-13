class RemoveBandcampLinkFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :bandcamp_link, :string
  end
end
