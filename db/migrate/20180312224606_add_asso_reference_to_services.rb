class AddAssoReferenceToServices < ActiveRecord::Migration[5.0]
  def change
    add_reference :services, :asso, foreign_key: true
  end
end
