class CarInfo < ApplicationRecord
    has_many :registation_infos, dependent :destroy
    has_many :wanted_lists, dependent :destroy

    validates :VIN, length: {is: 22}, presence: true, uniqueness: true
    validates :brand, presence: true, length: {2..20}
    validates :model, presence: true, length: {2..30}
end
