class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :product, index: true
      t.references :sale, index: true
      t.float :price
      t.integer :amount

      t.timestamps
    end
  end
end
