class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:comment,:edit,:update]

  def index
    @ladies = Product.category(1)
    @men = Product.category(2)
    @home_appliances = Product.category(8)
    @hobbies = Product.category(6)
    @chanel = Product.where(brand_id: "0").order(created_at: "DESC").limit(10)
    @gucci = Product.where(brand_id: "1").order(created_at: "DESC").limit(10)
    @prada = Product.where(brand_id: "2").order(created_at: "DESC").limit(10)
    @hermes = Product.where(brand_id: "3").order(created_at: "DESC").limit(10)
  end

  def show
    @comment =Comment.new
    @comments =@product.comments.includes(:user).all
  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.images.new
    else
      redirect_to root_path
    end
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
    if @product.update(update_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:name,:category_id,:price,:explain,:size,:brand_id,:status,:postage,:shipping_date,:prefecture,images_attributes: [:product_image,:_destroy,:id]).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.includes(:comments).find(params[:id])
    end
    def update_params
      params.require(:product).permit(:name, :explain, :price, :size, :brand_id, :category_id, :status, :shipping_date, :category_id, :brand_id, :user_id, images_attributes: [:product_image, :id])
    end
end
