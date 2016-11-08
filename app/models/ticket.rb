class Ticket < ApplicationRecord

  validates :title, :description, { presence: true }

end
