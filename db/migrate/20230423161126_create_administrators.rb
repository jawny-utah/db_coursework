class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :personal_information, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.date :date_of_birth

      t.timestamps
    end
  end
end
