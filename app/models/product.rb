class Product < ApplicationRecord
    has_many_attached :images
    belongs_to :category
    has_rich_text :description

    store :options, accessors: [:size_options, :format_options], coder: JSON
  end