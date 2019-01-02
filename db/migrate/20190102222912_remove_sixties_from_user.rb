class RemoveSixtiesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :sixties, :boolean
  end
end
