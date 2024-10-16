class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
    # if current_user
    #   @products = Product.all
    #   render template: "products/index"
    # else
    #   render json: []
    # end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    # p params
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    # happy/sad path
    if @product.save
      render template: "products/show"
    else
      # error handling
      p @product.errors.full_messages
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    p params
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    # happy/sad path
    if @product.save
      render template: "products/show"
    else
      # error handling
      p @product.errors.full_messages
      render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render template: "products/show"
  end

  def espresso_equipment
    @category_products = CategoryProduct.where(category_id: 2)
  end

end
