class AddTwitterLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :twitter_link, :string, default: nil
  end
end
