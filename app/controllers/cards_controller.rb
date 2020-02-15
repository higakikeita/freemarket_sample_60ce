class CardsController < ApplicationController
  require "payjp"
  before_action :set_creditcard

  def show
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


  def



  # 機能追加時に使用
  # def destroy #PayjpとCardのデータベースを削除
  #   Payjp.api_key = "秘密鍵"
  #   customer = Payjp::Customer.retrieve(@card.customer_id)
  #   customer.delete
  #   if @card.destroy #削除に成功した時にポップアップを表示します。
  #     redirect_to action: "index", notice: "削除しました"
  #   else #削除に失敗した時にアラートを表示します。
  #     redirect_to action: "index", alert: "削除できませんでした"
  #   end
  # end

  private

  def set_creditcard
    @creditcard = Creditcard.where(user_id: current_user.id).first if Creditcard.where(user_id: current_user.id).present?
  end
end
