class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:comment,:edit]
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def show
    @comment =Comment.new
    @comments =@product.comments
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
  def edit
    @comment =Comment.new
    @comments =@product.comments
  end
  def update
    product=Product.includes(:comments).find(params[:id])
    product.update(set_detail)
  end

  private
    def product_params
      params.require(:product).permit(:name,:category_id,:price,:explain,:size,:status,:postage,:shipping_date,:prefecture,images_attributes: [:product_image])
    end

    def set_product
      @product = Product.includes(:comments).find(params[:id])
      
    end
end

