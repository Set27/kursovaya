class WantedList < ApplicationRecord
  belongs_to :cat_info
  validates :state_number, presence: true, format: {
    with: /[0-9]{4}[A-Z]{2}-[1-7]/, message: 'not valid state number'
  }
  validates :description, presence: true
end
