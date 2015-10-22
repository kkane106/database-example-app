class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :lastname
      t.string :firstname
      t.string :mi
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :area_code
      t.integer :phone_number

      t.timestamps
    end
  end
end
