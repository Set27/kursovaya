class RegistationInfo < ApplicationRecord
  belongs_to :car_holder_info
  belongs_to :car_info
  has_many :fines, dependent :destroy
  has_many :car_complaints, dependent :destroy

  validates :state_number, presence: true, uniqueness: true, format: {
    with: /[0-9]{4}[A-Z]{2}-[1-7]/, message: 'not valid state number'
  }
  validates :date_of_registation, presence: true
end
