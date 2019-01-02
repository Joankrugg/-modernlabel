class RemoveEightiesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :eighties, :boolean
  end
end
