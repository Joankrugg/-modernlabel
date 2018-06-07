class AddContentToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :content, :string
  end
end
