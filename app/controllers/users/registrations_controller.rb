# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    params[:user][:birthday] = params[:birthday]
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    session["address"] = @address.attributes
    @creditcard = @user.build_creditcard
    render :new_credit_card
  end

  def create_creditcard
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(session["address"])
    Payjp.api_key = 'sk_test_be263def71d21c8f58b223e3'
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      # 顧客情報をPAY.JPに登録。
      customer = Payjp::Customer.create(
        description: 'test', 
        email: @user.email,
        card: params['payjpToken'], 
      )
    end
    @creditcard = Creditcard.new(creditcard_params)
    @creditcard[:customer_id]=customer.id
    @creditcard[:card_id]=customer.default_card
    unless @creditcard.valid?
      flash.now[:alert] = @creditcard.errors.full_messages
      render :new_credit_card and return
    end
    @user.build_address(@address.attributes)
    @user.build_creditcard(@creditcard.attributes)
    if @user.save
      sign_in(:user, @user)
    else
      render :new
    end
  end

  protected
  def address_params
    params.require(:address).permit(:address,:postal_code, :prefecture,:city,:apartment)
  end

  def creditcard_params
    params.require(:creditcard).permit(:card_number,:card_year, :card_month, :card_pass,:card_company)
  end



  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
