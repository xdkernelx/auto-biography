class Repair < ApplicationRecord

  validates :title, :description, :mileage, :date_completed, { presence: true }

end
