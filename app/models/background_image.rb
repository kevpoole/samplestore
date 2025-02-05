class BackgroundImage < ApplicationRecord
  has_one_attached :image

  validate :single_record

  def single_record
    if BackgroundImage.exists? && persisted? == false
      errors.add(:base, "Only one background image is allowed.")
    end
  end
end
