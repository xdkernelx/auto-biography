class Repair < ApplicationRecord

  belongs_to :issue
  belongs_to :mechanic, class_name: "User"

  validates :title, :description, :mileage, :date_completed, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }

end
