class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :activities
  has_many :products, through: :company

  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end


end
