class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :vendor_rep_id
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.integer :area_code
      t.integer :phone_number

      t.timestamps
    end
  end
end
