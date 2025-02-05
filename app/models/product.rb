class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category
    has_rich_text :description

    store :options, accessors: [:size_options, :format_options], coder: JSON

    before_destroy :delete_images_from_s3, prepend: true

    private

    def delete_images_from_s3
      images.each(&:purge) if images.attached?
    end
  end