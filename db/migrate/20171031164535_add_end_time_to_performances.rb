class AddEndTimeToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :end_time, :datetime
  end
end
