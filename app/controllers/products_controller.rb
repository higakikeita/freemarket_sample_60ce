class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_product, only: [:show,:comment,:edit,:update]
  
  def index
    @ladies = Product.where(category_id: "1").order(created_at: "DESC").limit(10)
    @men = Product.where(category_id: "2").order(created_at: "DESC").limit(10)
    @home_appliances = Product.where(category_id: "8").order(created_at: "DESC").limit(10)
    @hobbies = Product.where(category_id: "6").order(created_at: "DESC").limit(10)
  end

  def show
    @comment =Comment.new
    @comments =@product.comments.includes(:user).all
  end

  def buy
    @user = current_user
    @creditcard = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
    @address = Address.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
    Payjp.api_key = "sk_test_be263def71d21c8f58b223e3"
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
    @card_brand = @creditcard_information.brand 
    case @card_brand
    when "Visa"
      @card_src = "visa.svg"
    when "JCB"
      @card_src = "jcb.svg"
    when "MasterCard"
      @card_src = "master-card.svg"
    when "American Express"
      @card_src = "american_express.svg"
    when "Diners Club"
      @card_src = "dinersclub.svg"
    when "Discover"
      @card_src = "discover.svg"
    end
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

  def purchase
    @creditcard = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
    @product = Product.find(params[:id])
    Payjp.api_key= 'sk_test_be263def71d21c8f58b223e3'
    # customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to purchased_product_path
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
