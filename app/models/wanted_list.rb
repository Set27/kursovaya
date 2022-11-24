class WantedList < ApplicationRecord
  belongs_to :car_info
  belongs_to :registation_info
  validates :description, presence: true
end
