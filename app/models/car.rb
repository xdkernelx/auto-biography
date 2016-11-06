require 'securerandom'

class Car < ApplicationRecord

  belongs_to :user
  has_many :issues
  has_many :maintenances

  validates :mileage, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }
  validates :vin, format: { with: /\A[a-zA-Z0-9_]{17}\z/ }, allow_blank: true
end
