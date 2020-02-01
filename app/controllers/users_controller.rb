class UsersController < ApplicationController

  def index
  end

  def edit
    @user = User.find(params[:id])
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
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
end
