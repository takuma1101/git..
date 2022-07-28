class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customers_id
      t.string :shiping_fee
      t.string :bill
      t.integer :payment_method
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :is_active

      t.timestamps
    end
  end
end
