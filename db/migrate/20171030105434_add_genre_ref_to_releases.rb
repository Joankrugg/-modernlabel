class AddGenreRefToReleases < ActiveRecord::Migration[5.0]
  def change
    add_reference :releases, :genre, foreign_key: true
  end
end
