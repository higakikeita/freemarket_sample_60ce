class ProductsController < ApplicationController
  before_action :set_detail, only: [:show]
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name,:category_id,:price,:explain,:status,:postage,:shipping_date,:prefecture,images_attributes: [:product_image])
    end

    def set_detail
      @product = Product.find(params[:id])
      
    end
end

