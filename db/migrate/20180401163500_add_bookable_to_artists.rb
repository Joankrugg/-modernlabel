class AddBookableToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :bookable, :boolean, default: false
  end
end
