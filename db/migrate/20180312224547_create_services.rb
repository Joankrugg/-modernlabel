class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.integer :adhesion_fee

      t.timestamps
    end
  end
end
