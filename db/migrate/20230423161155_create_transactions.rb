class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :order
      t.integer :status

      t.timestamps
    end
  end
end
