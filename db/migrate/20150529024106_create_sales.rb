class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :client, index: true
      t.string :type_name
      t.float :total_price

      t.timestamps
    end
  end
end
