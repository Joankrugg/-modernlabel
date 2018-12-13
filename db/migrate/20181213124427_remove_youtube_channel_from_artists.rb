class RemoveYoutubeChannelFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :youtube_channel, :string
  end
end
