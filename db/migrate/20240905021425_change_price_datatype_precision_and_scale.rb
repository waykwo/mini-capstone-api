class ChangePriceDatatypePrecisionAndScale < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
