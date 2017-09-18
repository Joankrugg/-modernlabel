class AddRecordRefToReleases < ActiveRecord::Migration[5.0]
  def change
    add_reference :releases, :record, foreign_key: true
  end
end
