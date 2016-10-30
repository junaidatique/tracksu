class Purpose < ApplicationRecord
  has_and_belongs_to_many :activities

  def is_activated?
    activated?
  end


  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end
end
