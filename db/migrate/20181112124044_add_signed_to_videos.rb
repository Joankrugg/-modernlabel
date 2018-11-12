class AddSignedToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :signed, :boolean, default: false
  end
end
