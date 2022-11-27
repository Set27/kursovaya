class WantedList < ApplicationRecord
  belongs_to :car_info
  belongs_to :registation_info, optional: true
  validates :description, presence: true

  validate :car_with_registration

  private

  def car_with_registration
    if registation_info.present? && !car_info.registation_infos.exists?(registation_info.id)
      errors.add(:registation_info, "не для выбранной машины")
    end
  end
end
