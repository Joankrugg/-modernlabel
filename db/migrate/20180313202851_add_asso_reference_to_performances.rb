class AddAssoReferenceToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :asso, foreign_key: true
  end
end
