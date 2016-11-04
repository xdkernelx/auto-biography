class Car < ApplicationRecord

  belongs_to :user
  has_many :issues, :maintenances

  validates :mileage, { presence: true }
  validates :vin, length: { is: 17 }, allow_blank: true
  validates :vin, format: { with: /\A[a-zA-Z0-9_]{17}\z/ }

end
