class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      t.integer :duration, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
