class AddPhotoToActus < ActiveRecord::Migration[5.0]
  def change
    add_column :actus, :photo, :string
  end
end
