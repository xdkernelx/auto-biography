class Maintenance < ApplicationRecord
	# scope :recent, -> { order("date_completed ASC") }

  belongs_to :car
  belongs_to :mechanic, class_name: "User", optional: true

  validates :title, :description, :mileage, :date_completed, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }
  validate :mechanic_status

  def mechanic_status

    begin
      user = User.find(self.mechanic_id)
    rescue
      errors.add(:mechanic_id, "Could not find user.")
    else
      user = User.find(self.mechanic_id)
      if (!user.mech_status)
        errors.add(:mechanic_id, "id must belong to a mechanic user.")
      end
    end

  end

end
