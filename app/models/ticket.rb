class Ticket < ApplicationRecord

  has_many :comments, as: :commentable

  validates :title, :description, { presence: true }

end
