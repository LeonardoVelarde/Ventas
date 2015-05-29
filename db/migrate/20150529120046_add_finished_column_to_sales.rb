class AddFinishedColumnToSales < ActiveRecord::Migration
  def change
    add_column :sales, :finished, :boolean
  end
end
