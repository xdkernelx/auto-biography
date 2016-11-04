class Car < ApplicationRecord

  validates :mileage, { presence: true }
  validates :vin, length: { is: 17 }
  validates :vin, format: { with: /\A[a-zA-Z0-9_]{17}\z/ }

end
