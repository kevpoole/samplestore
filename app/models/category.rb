class Category < ApplicationRecord
    has_one_attached :image
    has_many :products

    after_save :skip_analysis

  private

  def skip_analysis
    image.analyze_later = false if image.attached?
  end
end