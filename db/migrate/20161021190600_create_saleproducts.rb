class CreateSaleproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :saleproducts do |t|
      t.references :activity, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :rate
      t.integer :quantity

      t.timestamps
    end
  end
end
