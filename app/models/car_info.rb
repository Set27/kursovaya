class CarInfo < ApplicationRecord
    has_many :registation_infos
    has_many :wanted_lists
end
