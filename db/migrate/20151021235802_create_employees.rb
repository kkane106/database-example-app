class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :person_id
      t.integer :store_number
      t.string :pay_type_code
      t.integer :pay_amount
      t.string :title
      t.integer :supervisor_id

      t.timestamps
    end
  end
end
