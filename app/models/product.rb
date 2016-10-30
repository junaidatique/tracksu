class Product < ApplicationRecord
  belongs_to :company
  has_many :activities, through: :saleproducts
  has_many :saleproducts
  def is_activated?
    activated?
  end

end
