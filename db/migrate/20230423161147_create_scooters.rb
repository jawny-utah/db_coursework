class CreateScooters < ActiveRecord::Migration[7.0]
  def change
    create_table :scooters do |t|
      t.string :model, null: false
      t.float :range, null: false
      t.float :weight, null: false
      t.float :max_speed, null: false
      t.float :power, null: false

      t.timestamps
    end
  end
end
