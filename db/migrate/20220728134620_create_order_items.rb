class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

     t.string :items_id
     t.string :order_id
     t.string :quantity
     t.integer :is_active
     t.string :price
     
      t.timestamps
    end
  end
end
