class Permission < ApplicationRecord

  belongs_to :car
  belongs_to :issue, optional: true

  validates :type, :token, { presence: true }
  validates :type, format: { with: /\A[a-zA-Z]\z/ }

end
