class Place < ApplicationRecord
  belongs_to :company
  has_many :activities, dependent: :destroy

  def is_customer?
    customer_type?
  end

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? and obj.latitude.blank? and obj.longitude.blank? }
end
