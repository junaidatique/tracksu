class Product < ApplicationRecord
  belongs_to :company
  has_many :activities, through: :saleproducts
  has_many :saleproducts

  scope :active, -> { where(activated: true) }

  def is_activated?
    activated?
  end

end
