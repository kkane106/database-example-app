class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :account_type_code
      t.integer :person_id
      t.integer :credit_limit
      t.float :balance
      t.string :street
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
