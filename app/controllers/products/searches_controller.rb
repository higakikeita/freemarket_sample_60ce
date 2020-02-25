class Products::SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @products = Product.search(params[:keyword]).order("id DESC")

    @keyword = params[:keyword]

    @products = @q.result(distinct: true)
  end

  private
  def set_ransack
    @q = Product.ransack(params[:q])
  end
  def search_params
    params.require(:q).permit(:search_order,:name_cont,:brand_cont,:size_id_eq,:status_id_eq,:shipping_fee_id_eq,:purchase_status_id_eq,:category_grandparent_id_eq,:category_parent_id_eq,:category_id_eq,:price_lteq,:price_gteq)
  end
end
