class AddOneWordToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :one_word, :string
  end
end
