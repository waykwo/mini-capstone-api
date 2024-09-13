class OrdersController < ApplicationController
  def index
    p "===== HERE ====="
    pp current_user
    p "===== HERE ====="
    @orders = Order.where(user_id: current_user.id)
    render :index
    # render json: {message: "test orders index"}
  end

  def show
    @order = Order.find_by(id: 1)
    # p "===== HERE ====="
    # pp @order.user_id
    # p "===== HERE ====="
    if current_user && @order.user_id == current_user.id
      render :show
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    params_product_id = params[:product_id]
    price = Product.find_by(id: params_product_id).price
    subtotal = price * params[:quantity].to_d
    tax = 0.09 * subtotal
    
    @order = Order.create(
      user_id: current_user.id,
      product_id: params_product_id,
      quantity: params[:quantity],
      # subtotal: params[:subtotal],
      subtotal: subtotal,
      tax: tax,
      total: subtotal + tax
    )
    render :show
  end
end
