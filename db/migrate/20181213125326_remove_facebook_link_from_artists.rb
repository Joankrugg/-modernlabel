class RemoveFacebookLinkFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :facebook_link, :string
  end
end
