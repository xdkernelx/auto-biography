class ReportType < ApplicationRecord

  validates :type, :name, { presence: true }

end
