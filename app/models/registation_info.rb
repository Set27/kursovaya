class RegistationInfo < ApplicationRecord
  belongs_to :car_holder_info
  belongs_to :car_info
  has_many :fines
  has_many :car_complaints
end
