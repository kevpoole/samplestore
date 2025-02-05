class BackgroundImage < ApplicationRecord
  has_one_attached :image

  validate :single_record

  def single_record
    if BackgroundImage.exists? && persisted? == false
      errors.add(:base, "Only one background image is allowed.")
    end
  end

  before_destroy :delete_image_from_s3, prepend: true

  private

  def delete_image_from_s3
    image.purge if image.attached?
  end
end
