class CreateInstrumentHirings < ActiveRecord::Migration[5.0]
  def change
    create_table :instrument_hirings do |t|
      t.references :artist, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
