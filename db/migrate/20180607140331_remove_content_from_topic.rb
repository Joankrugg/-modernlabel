class RemoveContentFromTopic < ActiveRecord::Migration[5.0]
  def change
    remove_column :topics, :content
  end
end
