class Ticket < ApplicationRecord

  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :car

  validates :title, :description, { presence: true }

end
