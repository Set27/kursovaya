class CarComplaint < ApplicationRecord
  belongs_to :registation_info
  validates :address, presence: true
  validates :description, presence: true
end
