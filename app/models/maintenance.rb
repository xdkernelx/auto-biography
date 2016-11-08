class Maintenance < ApplicationRecord

  has_many :comments, as: :commentable
  belongs_to :car
  belongs_to :mechanic, class_name: "User", optional: true

  validates :title, :description, :mileage, :date_completed, { presence: true }
  validates :mileage, numericality: { greater_than: 0 }
  validate :mechanic_status

  def mechanic_status
    if self.mechanic_id
      begin
        user = User.find(self.mechanic_id)
      rescue
        errors.add(:mechanic_id, "mechanic does not exist.")
      else
        user = User.find(self.mechanic_id)
        if (!user.mech_status)
          errors.add(:mechanic_id, "id must belong to a mechanic user.")
        end
      end
    end

  end

end
