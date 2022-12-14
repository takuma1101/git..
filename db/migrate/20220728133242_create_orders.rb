class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :shipping_fee
      t.string :bill
      t.integer :payment_method
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :order_status, default: 0, null: false

      t.timestamps
    end
  end
end
