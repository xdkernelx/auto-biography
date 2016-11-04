class Repair < ApplicationRecord

  belongs_to :issue

  validates :title, :description, :mileage, :date_completed, { presence: true }

end
