class AddPhoneNumberToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :phone_number, :string
  end
end
