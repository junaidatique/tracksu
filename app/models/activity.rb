class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many :tracking_points, dependent: :destroy
  has_and_belongs_to_many :purposes
  has_many :products, through: :saleproducts
  has_many :saleproducts, dependent: :destroy

  before_save :update_start_time
  accepts_nested_attributes_for :place
  accepts_nested_attributes_for :saleproducts

  def place_attributes=(attributes)
    if attributes['id'].present?
      self.place = Place.find(attributes['id'])
    end
    super
  end

  def update_start_time
    #puts start_time
    self.activity_date = DateTime.strptime(start_time.to_s, "%d/%m/%Y %H:%M").to_date

  end



end
