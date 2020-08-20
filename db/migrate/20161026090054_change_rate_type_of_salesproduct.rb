class ChangeRateTypeOfSalesproduct < ActiveRecord::Migration[5.0]
  def change
    change_column(:saleproducts, :rate, :float)
  end
end
