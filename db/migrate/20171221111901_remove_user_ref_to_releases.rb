class RemoveUserRefToReleases < ActiveRecord::Migration[5.0]
  def change
    remove_reference :releases, :user, foreign_key: true
  end
end
