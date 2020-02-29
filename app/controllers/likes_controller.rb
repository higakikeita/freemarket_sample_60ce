class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(product_id: params[:product_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
