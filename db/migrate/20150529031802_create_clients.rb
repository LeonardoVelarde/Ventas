class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :nit
      t.string :direction
      t.boolean :trusted

      t.timestamps
    end
  end
end
