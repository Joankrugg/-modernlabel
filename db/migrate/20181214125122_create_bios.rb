class CreateBios < ActiveRecord::Migration[5.0]
  def change
    create_table :bios do |t|
      t.text :content
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
