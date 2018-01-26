class AddYearOfCreationtoReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :year_of_creation, :integer
  end
end
