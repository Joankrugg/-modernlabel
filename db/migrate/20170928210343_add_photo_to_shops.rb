class AddPhotoToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :photo, :string
  end
end
