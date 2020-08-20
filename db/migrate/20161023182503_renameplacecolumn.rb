class Renameplacecolumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :places, :type, :customer_type
  end
end
