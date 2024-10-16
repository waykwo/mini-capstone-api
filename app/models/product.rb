class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :description, length: {in: 5..500}

  belongs_to :supplier
  has_many :images
  # has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    return (price * 0.09).round(2)
  end

  def total
    return (price + tax).round(2)
  end
end
