class AddCompanyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :company, foreign_key: true
  end
end
