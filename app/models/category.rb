class Category < ApplicationRecord
    has_one_attached :image
    has_many :products

    attachable.analyze_later false 
end