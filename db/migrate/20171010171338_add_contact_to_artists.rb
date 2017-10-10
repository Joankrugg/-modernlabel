class AddContactToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :contact, :string
  end
end
