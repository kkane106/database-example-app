class CreateOrderHeaders < ActiveRecord::Migration
  def change
    create_table :order_headers do |t|
      t.integer :invoice_number
      t.integer :store_number
      t.integer :person_id
      t.date    :order_date
      t.date    :est_delivery_date
      t.date    :delivery_date
      t.integer :account_number
      t.float :amount_due

      t.timestamps
    end
  end
end
