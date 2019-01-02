class RemoveFivetiesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :fiveties, :boolean
  end
end
