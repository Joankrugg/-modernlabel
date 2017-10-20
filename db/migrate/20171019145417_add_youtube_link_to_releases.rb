class AddYoutubeLinkToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :youtube_link, :string, default: nil
  end
end
