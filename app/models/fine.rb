class Fine < ApplicationRecord
  belongs_to :registation_info
  validates :date_of_recepeit, presence: true
  validates :article, presence: true
  validates :amount, presence: true
  
end
