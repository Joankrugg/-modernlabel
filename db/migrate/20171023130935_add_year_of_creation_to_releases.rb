class AddYearOfCreationToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :year_of_creation, :datetime
  end
end
