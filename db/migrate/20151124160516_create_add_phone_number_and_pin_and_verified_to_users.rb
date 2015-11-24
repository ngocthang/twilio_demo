class CreateAddPhoneNumberAndPinAndVerifiedToUsers < ActiveRecord::Migration
  def change
    create_table :add_phone_number_and_pin_and_verified_to_users do |t|
      t.string :phone_number
      t.string :pin
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
