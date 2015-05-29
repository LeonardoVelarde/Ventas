class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :description
      t.float   :whole_sale_price
      t.float   :retail_price
      t.integer :amount

      t.timestamps
    end
  end
end
