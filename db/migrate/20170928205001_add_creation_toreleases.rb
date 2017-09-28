class AddCreationToreleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :creation, :date
  end
end
