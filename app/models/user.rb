class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :lockable, :trackable, :validatable

  has_many :cars

  validates :first_name, :last_name, { presence: true }
  validates :zip_code, format: { with: /\A[0-9]{5}\z/ }, allow_blank: true
  validates :phone, format: { with: /\A[0-9]{10}\z/ }, allow_blank: true

end
