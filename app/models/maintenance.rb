class Maintenance < ApplicationRecord

  belongs_to :car

  validates :title, :description, :mileage, :date_completed, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }

end
