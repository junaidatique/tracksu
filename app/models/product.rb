class Product < ApplicationRecord
  belongs_to :company

  def is_activated?
    activated?
  end

  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end
end
