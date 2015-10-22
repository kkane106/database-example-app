class CreatePoHeaders < ActiveRecord::Migration
  def change
    create_table :po_headers do |t|
      t.integer :po_number
      t.integer :vendor_id
      t.integer :store_number
      t.date :order_date
      t.integer :tax_rate

      t.timestamps
    end
  end
end
