class AddFacebookEventToPerformances < ActiveRecord::Migration[5.0]
  def change
    add_column :performances, :facebook_event, :string, default: nil
  end
end
