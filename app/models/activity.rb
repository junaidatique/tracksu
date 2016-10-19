class Activity < ApplicationRecord
  belongs_to :user
  has_one :place
  has_many :tracking_points, dependent: :destroy
  has_many :histories, dependent: :destroy

  accepts_nested_attributes_for :place

end
