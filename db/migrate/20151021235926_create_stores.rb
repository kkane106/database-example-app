class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :manager_id
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :area_code
      t.integer :phone_number
      t.integer :sales_tax_rate

      t.timestamps
    end
  end
end
