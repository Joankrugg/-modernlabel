class AddMilleniumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :millenium, :boolean, default: false
  end
end
