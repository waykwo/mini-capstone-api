class OrdersController < ApplicationController
  def index
    p "===== HERE ====="
    pp current_user
    p "===== HERE ====="
    # @orders = Order.all
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def show
    @order = Order.find_by(id: current_user.id)
    p "===== HERE ====="
    pp @order.user_id
    p "===== HERE ====="
    if current_user && @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    p "===== HERE ====="
    pp current_user
    p "===== HERE ====="

    # params_product_id = params[:product_id]
    # price = Product.find_by(id: params_product_id).price
    
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    
    cart_subtotal = 0
    @carted_products.each do |item|
      cart_subtotal += item.quantity * item.product.price      
    end
    
    cart_tax = cart_subtotal * 0.13

    @order = Order.new(
      user_id: current_user.id,
      subtotal: cart_subtotal,
      tax: cart_tax,
      total: cart_subtotal + cart_tax
    )
    @order.save!

    # Update carted_products
    @carted_products.each do |item|
      item.order_id = @order.id
      item.status = "purchased"
      item.save
    end
    render :show
    
  end

    # render json: {
    #   # quantity: @carted_products[1].quantity,
    #   # product: @carted_products[1].product.name,
    #   # price: @carted_products[1].product.price,
    #   user_id: current_user.id,
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: subtotal + tax
    # }

    # subtotal = price * params[:quantity].to_d
    # tax = 0.09 * subtotal
    
    # @order = Order.new(
    #   user_id: current_user.id,
    #   # product_id: params_product_id,
    #   # quantity: params[:quantity],
    #   # subtotal: params[:subtotal],
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: subtotal + tax
    # )
    # render :show
end
