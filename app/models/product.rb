class Product < ApplicationRecord
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
