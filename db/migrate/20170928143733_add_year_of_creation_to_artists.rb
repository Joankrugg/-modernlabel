class AddYearOfCreationToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :year_of_creation, :integer
  end
end
