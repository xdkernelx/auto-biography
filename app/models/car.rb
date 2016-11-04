class Car < ApplicationRecord

  validates :mileage, { presence: true }
  validates :vin, length: { is: 17 }

end
