class AddLinkToActus < ActiveRecord::Migration[5.0]
  def change
    add_column :actus, :link, :string
  end
end
