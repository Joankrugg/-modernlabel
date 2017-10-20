class AddPhotoToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :photo, :string
  end
end
