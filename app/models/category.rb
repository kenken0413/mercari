class Category < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :category_brands
  has_many :brands, through: :category_brands
  
end
