class CreateInstrumentPlayings < ActiveRecord::Migration[5.0]
  def change
    create_table :instrument_playings do |t|
      t.references :user, foreign_key: true
      t.references :instrument, foreign_key: true

      t.timestamps
    end
  end
end
