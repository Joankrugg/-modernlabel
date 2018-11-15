class AddNinetiesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nineties, :boolean, default: false
  end
end
