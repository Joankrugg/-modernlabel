class AddAssoReferenceToVideos < ActiveRecord::Migration[5.0]
  def change
    add_reference :videos, :asso, foreign_key: true
  end
end
