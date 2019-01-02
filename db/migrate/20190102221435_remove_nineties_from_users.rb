class RemoveNinetiesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :nineties, :boolean
  end
end
