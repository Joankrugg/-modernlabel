class AddActivityClassRefToAssos < ActiveRecord::Migration[5.0]
  def change
    add_reference :assos, :activity_class, foreign_key: true
  end
end
