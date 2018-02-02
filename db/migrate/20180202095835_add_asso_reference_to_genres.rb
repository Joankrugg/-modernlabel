class AddAssoReferenceToGenres < ActiveRecord::Migration[5.0]
  def change
    add_reference :assos, :genre, foreign_key: true
  end
end
