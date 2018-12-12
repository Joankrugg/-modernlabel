class CreateTwitters < ActiveRecord::Migration[5.0]
  def change
    create_table :twitters do |t|
      t.string :link
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
