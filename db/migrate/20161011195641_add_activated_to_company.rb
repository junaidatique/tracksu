class AddActivatedToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :activated, :boolean
  end
end
