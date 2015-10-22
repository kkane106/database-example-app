class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :account_type_code
      t.string :account_type_name
      t.integer :initial_discount

      t.timestamps
    end
  end
end
