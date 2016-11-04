class Ticket < ApplicationRecord

  validates :title, { presence: true }

end
