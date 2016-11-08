class Permission < ApplicationRecord

  belongs_to :car
  belongs_to :issue, optional: true

  validates :report_type, :token, { presence: true }
  validates :report_type, format: { with: /\A[a-zA-Z]\z/ }

end
