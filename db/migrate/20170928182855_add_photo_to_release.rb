class AddPhotoToRelease < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :photo, :string
  end
end
