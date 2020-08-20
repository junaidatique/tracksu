class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :type, :customer_type
  end
end
