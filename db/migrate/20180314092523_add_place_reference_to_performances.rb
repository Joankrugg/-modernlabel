class AddPlaceReferenceToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :place, foreign_key: true
  end
end
