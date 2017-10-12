class AddBandcampLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :bandcamp_link, :string
  end
end
