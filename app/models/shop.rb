class Shop < ApplicationRecord

  has_many :comments, as: :commentable

  validates :name, :address, :city, :state, :zip_code, { presence: true }
  validates :state, format: { with: /\A[A-Z]{2}\z/ }
  validates :zip_code, format: { with: /\A[0-9]{5}\z/ }
  validates :phone, format: { with: /\A[0-9]{10}\z/ }, allow_blank: true

end
