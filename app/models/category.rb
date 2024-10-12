class Category < ApplicationRecord
  has_many :cateory_products
  has_many :products, through: :category_products
end
