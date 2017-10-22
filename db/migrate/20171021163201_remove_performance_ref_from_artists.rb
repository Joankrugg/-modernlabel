class RemovePerformanceRefFromArtists < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :artists, column: :performance_id
    remove_column :artists, :performance_id, :integer
  end
end
