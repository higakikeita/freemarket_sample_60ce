class Products::SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword]).order("id DESC")
    @keyword = params[:keyword]
  end
end
