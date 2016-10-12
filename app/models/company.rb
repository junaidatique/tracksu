class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :places, dependent: :destroy
end
