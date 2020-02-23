class Products::SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword]).order("id DESC")
    @keyword = params[:keyword]
    @search = Product.search(params[:q])
    # @products = @search.result
  end
end
