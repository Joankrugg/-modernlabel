class RemoveSeventiesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :seventies, :boolean
  end
end
