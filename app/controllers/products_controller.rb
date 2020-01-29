class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:comment]
  def index
    @ladies = Product.where(category_id: "1").order(created_at: "DESC").limit(10)
    @mens = Product.where(category_id: "2").order(created_at: "DESC").limit(10)
    @home_appliances = Product.where(category_id: "8").order(created_at: "DESC").limit(10)
    @hobbies = Product.where(category_id: "6").order(created_at: "DESC").limit(10)
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

  private
    def product_params
      params.require(:product).permit(:name,:category_id,:price,:explain,:size,:status,:postage,:shipping_date,:prefecture,images_attributes: [:product_image])
    end

    def set_product
      @product = Product.includes(:comments).find(params[:id])
    end
end