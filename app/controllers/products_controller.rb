class ProductsController < ApplicationController
  def all
    render json: {message: "hello"}
  end
end
