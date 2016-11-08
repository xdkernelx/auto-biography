require 'securerandom'

class Car < ApplicationRecord

  has_many :issues
  has_many :repairs, through: :issues
  has_many :maintenances
  has_many :permissions
  has_one :ticket
  belongs_to :user

  validates :mileage, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }
  validates :vin, format: { with: /\A[a-zA-Z0-9]{17}\z/ }, allow_blank: true

  def recent_maintenances(limit)
    self.maintenances.sort_by{|maintenance| maintenance.date_completed}.reverse!.take(limit)
  end

  def recent_repairs(limit)
    self.repairs.sort_by{|repair| repair.date_completed}.reverse!.take(limit)
  end

  def recent_issues(limit)
    self.issues.sort_by{|issue| issue.updated_at}.reverse!.take(limit)
  end

end
