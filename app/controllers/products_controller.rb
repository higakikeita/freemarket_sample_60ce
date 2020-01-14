class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def show
  end
end
