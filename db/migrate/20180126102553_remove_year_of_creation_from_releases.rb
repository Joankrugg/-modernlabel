class RemoveYearOfCreationFromReleases < ActiveRecord::Migration[5.0]
  def change
    remove_column :releases, :year_of_creation, :datetime
  end
end
