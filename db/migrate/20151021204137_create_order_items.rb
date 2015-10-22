class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :invoice_number
      t.integer :product_id
      t.integer :quantity
      t.float :discount

      t.timestamps
    end
  end
end
