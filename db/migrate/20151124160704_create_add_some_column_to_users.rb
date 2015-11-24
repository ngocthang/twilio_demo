class CreateAddSomeColumnToUsers < ActiveRecord::Migration
  def change
    create_table :add_some_column_to_users do |t|
      t.string :phone_number
      t.string :pin
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
