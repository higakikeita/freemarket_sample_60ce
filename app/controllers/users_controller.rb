class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit]
  before_action :set_address, only: [:edit, :update]

  def show
  end


  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to edit_user_path(@address)
    else
      render :edit
    end
  end
  
  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :address, :apartment)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_address
    @address = Address.find(params[:id])
  end
  
end