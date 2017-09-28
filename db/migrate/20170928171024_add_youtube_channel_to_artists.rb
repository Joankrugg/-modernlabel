class AddYoutubeChannelToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :youtube_channel, :string
  end
end
