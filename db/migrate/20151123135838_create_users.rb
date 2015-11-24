class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :pin
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
