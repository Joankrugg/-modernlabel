class AddActivityClassRefToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :places, :activity_class, foreign_key: true
  end
end
