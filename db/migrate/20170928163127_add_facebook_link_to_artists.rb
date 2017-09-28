class AddFacebookLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :facebook_link, :string
  end
end
