class CreatePayTypes < ActiveRecord::Migration
  def change
    create_table :pay_types do |t|
      t.string :pay_type_code
      t.string :pay_type_name
      t.integer :minimum_wage

      t.timestamps
    end
  end
end
