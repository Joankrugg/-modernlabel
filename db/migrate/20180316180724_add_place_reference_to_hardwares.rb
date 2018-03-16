class AddPlaceReferenceToHardwares < ActiveRecord::Migration[5.0]
  def change
    add_reference :hardwares, :place, foreign_key: true
  end
end
