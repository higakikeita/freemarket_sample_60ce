class Products::SearchesController < ApplicationController
  def index
    @products = Product.search(params[:keyword]).order("id DESC")
    @keyword = search_params[:name_cont]
    @products = @q.result(distinct: true)
  end
end
