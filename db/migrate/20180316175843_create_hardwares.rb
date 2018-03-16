class CreateHardwares < ActiveRecord::Migration[5.0]
  def change
    create_table :hardwares do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.integer :number

      t.timestamps
    end
  end
end
