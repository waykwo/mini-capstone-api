class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: "glass",
      price: 12,
      description: "great for holding liquids but holds some solids too"
    )
    @product.save
    render template: "products/show"
  end
end
