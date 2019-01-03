class CreateUserCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :user_counties do |t|
      t.references :user, foreign_key: true
      t.references :county, foreign_key: true

      t.timestamps
    end
  end
end
