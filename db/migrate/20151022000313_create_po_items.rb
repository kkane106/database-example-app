class CreatePoItems < ActiveRecord::Migration
  def change
    create_table :po_items do |t|
      t.integer :po_number
      t.integer :vendor_part_number
      t.integer :quantity
      t.integer :unit_cost
      t.integer :product_id

      t.timestamps
    end
  end
end
