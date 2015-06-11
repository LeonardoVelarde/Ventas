class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.string :provider
      t.float :total_price

      t.timestamps
    end
  end
end
