class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :import, index: true
      t.references :product, index: true
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
