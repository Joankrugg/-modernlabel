class AddTypeReferenceToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :type, foreign_key: true
  end
end
