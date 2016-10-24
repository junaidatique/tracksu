class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :place, dependent: :destroy
  has_and_belongs_to_many :purposes
  has_many :products, through: :saleproducts
  has_many :saleproducts
  accepts_nested_attributes_for :place
  def place_attributes=(attributes)
    if attributes['id'].present?
      self.place = Place.find(attributes['id'])
    end
    super
  end
  accepts_nested_attributes_for :saleproducts

end
