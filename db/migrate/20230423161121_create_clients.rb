class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.date :date_of_birth
      t.decimal :balance, default: 0

      t.timestamps
    end
  end
end
