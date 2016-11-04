class Maintenance < ApplicationRecord

  belongs_to :car

  validates :title, :description, :mileage, :date_completed, { presence: true }

end
