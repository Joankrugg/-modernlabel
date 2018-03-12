class AddPhotoToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :photo, :string
  end
end
