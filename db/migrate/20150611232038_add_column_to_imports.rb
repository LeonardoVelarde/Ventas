class AddColumnToImports < ActiveRecord::Migration
  def change
    add_column :imports, :finished, :boolean
  end
end
