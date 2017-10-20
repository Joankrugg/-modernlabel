class AddBandcampLinkToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :bandcamp_link, :string, default: nil
  end
end
