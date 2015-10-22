class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :store_number
      t.integer :quantity_on_hand
      t.integer :quantity_on_order

      t.timestamps
    end
  end
end
