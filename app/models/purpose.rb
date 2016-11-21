class Purpose < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :activities

  scope :activated, -> { where(activated: true) }
  scope :active, -> { where(activated: true) }

  def is_activated?
    activated?
  end


  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end
end
