class RemoveDescriptionFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :description, :text
  end
end
