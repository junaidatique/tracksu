class Company < ApplicationRecord

  has_many :users, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :users

  validates_presence_of :title

  def is_activated?
    activated?
  end

  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end

end
