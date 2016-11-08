class Shop < ApplicationRecord

  validates :name, :address, :city, :state, :zip_code, { presence: true }
  validates :state, format: { with: /\A[0-9]{2}\z/ }
  validates :zip_code, format: { with: /\A[0-9]{5}\z/ }
  validates :phone, format: { with: /\A[0-9]{10}\z/ }, allow_blank: true

end
