class Category < ApplicationRecord
    has_one_attached :image
    has_many :products

    before_destroy :delete_image_from_s3, prepend: true

  private

  def delete_image_from_s3
    image.purge if image.attached?
  end
end