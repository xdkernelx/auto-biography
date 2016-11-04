class Report < ApplicationRecord

  validates :title, :description, :date_completed, { presence: true }
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

end
