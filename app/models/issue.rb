class Issue < ApplicationRecord

  belongs_to :car
  has_many :repairs

  validates :title, :description, { presence: true }
  validates :urgency, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

end
