class RemoveTwitterLinkFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :twitter_link, :string
  end
end
