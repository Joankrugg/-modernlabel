class RemoveEndTimeToPerformances < ActiveRecord::Migration[5.0]
  def change
    remove_column :performances, :end_time, :datetime
  end
end
