class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :order
      t.integer :rate, null: false
      t.string :body

      t.timestamps
    end
  end
end
