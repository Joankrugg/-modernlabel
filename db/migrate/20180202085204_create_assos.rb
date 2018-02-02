class CreateAssos < ActiveRecord::Migration[5.0]
  def change
    create_table :assos do |t|
      t.string :name
      t.string :city
      t.string :photo
      t.string :facebook_page

      t.timestamps
    end
  end
end
