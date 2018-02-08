class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.integer :heart
      t.integer :mic
      t.integer :note
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
