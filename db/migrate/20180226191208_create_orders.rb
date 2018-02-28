class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :user_id
      t.decimal :quantity
      t.integer :product_id
      t.decimal :payment
      t.decimal :total

      t.timestamps
    end
  end
end
