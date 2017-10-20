class AddInstaLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :insta_link, :string, default: nil
  end
end
