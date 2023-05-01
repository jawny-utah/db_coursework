class CreateClientSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :client_subscriptions do |t|
      t.belongs_to :client
      t.belongs_to :subscription
      t.datetime :started_at, null: false
      t.datetime :expires_at, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
