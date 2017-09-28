class AddNumberOfMusiciansToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :number_of_musicians, :integer
  end
end
