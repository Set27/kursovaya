class CarComplaint < ApplicationRecord
  belongs_to :registation_info
  validates :address, presence: true, length: {maximum: 50}
  validates :description, presence: true
end
