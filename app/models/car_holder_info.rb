class CarHolderInfo < ApplicationRecord
    has_many :registation_infos
    validates :full_name, presence: true
    validates :date_of_birth, presence: true
    validates :date_of_car_license, presence: true
end
