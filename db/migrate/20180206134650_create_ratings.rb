class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :beer
      t.integer :crowd
      t.integer :star
      t.integer :crown
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
