class AddSixtiesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sixties, :boolean, default: false
  end
end
