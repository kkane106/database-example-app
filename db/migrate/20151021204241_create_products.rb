class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.float :price
      t.integer :reorder_threshold

      t.timestamps
    end
  end
end
