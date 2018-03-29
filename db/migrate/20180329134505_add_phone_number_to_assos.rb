class AddPhoneNumberToAssos < ActiveRecord::Migration[5.0]
  def change
    add_column :assos, :phone_number, :string
  end
end
