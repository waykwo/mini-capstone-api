class ImagesController < ApplicationController
  def index
    p "===== HERE ====="
    pp current_user
    p "===== HERE ====="
    @images = Image.all
    render template: "images/index"
  end
end
