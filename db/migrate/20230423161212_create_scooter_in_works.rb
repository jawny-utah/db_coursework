class CreateScooterInWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :scooter_in_works do |t|
      t.belongs_to :scooter
      t.belongs_to :city
      t.float :batter_capacity, null: false
      t.float :current_battery, null: false
      t.string :current_location, null: false
      t.timestamps
    end
  end
end
