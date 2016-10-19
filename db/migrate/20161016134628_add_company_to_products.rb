class AddCompanyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :companies, foreign_key: true
  end
end
