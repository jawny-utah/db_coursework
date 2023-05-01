class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :scooter
      t.belongs_to :client
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.decimal :total_sum

      t.timestamps
    end
  end
end
