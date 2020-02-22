class ProductsController < ApplicationController
  require 'payjp'
  before_action :set_product, only: [:show,:comment,:edit,:update,:buy,:reserved,:reserve,:reserve_cancel,:destroy,:purchase]
  before_action :set_creditcard, only: [:buy, :purchase]
  before_action :set_product_purchase, only: [:buy, :purchase]
  
  def index
    @ladies = Product.category(1)
    @men = Product.category(2)
    @home_appliances = Product.category(8)
    @hobbies = Product.category(6)
    @chanel = Product.brand(0)
    @gucci = Product.brand(1)
    @prada = Product.brand(2)
    @hermes = Product.brand(3)
  end

  def show
    @comment =Comment.new
    @comments =@product.comments.includes(:user).all
  end

  def buy
    @address = Address.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.secrets.payjp_access_key
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
    if @product.images.present?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @comment =Comment.new
    @comments =@product.comments
  end

  def reserve
  end

  def reserved
    @product.update(product_params)
    if @product.reservation_email.present?
    else
      render :reserve
    end
  end

  def reserve_cancel
    if @product.update(reservation_email:"")
    redirect_to product_path
    else
    redirect_to product_path
    end
  end


  def update
    if @product.update(update_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if product.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def purchase
    Payjp.api_key = Rails.application.secrets.payjp_access_key
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )
    if @product.reservation_email.present?
      @product.update(reservation_email:"")
    end
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to purchased_product_path
  end


  private
    def product_params
      params.require(:product).permit(:name,:category_id,:price,:explain,:size,:brand_id,:status,:postage,:shipping_date,:prefecture,:reservation_email,images_attributes: [:product_image,:_destroy,:id]).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.includes(:comments).find(params[:id])
    end

    def set_product_purchase
      @product = Product.find(params[:id])
    end

    def update_params
      params.require(:product).permit(:name, :explain, :price, :size, :brand_id, :category_id, :status, :shipping_date, :category_id, :brand_id, :user_id, images_attributes: [:product_image, :id])
    end
    
    def set_creditcard
      @creditcard = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
    end
end
