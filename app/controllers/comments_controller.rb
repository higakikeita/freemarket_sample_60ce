class CommentsController < ApplicationController
  
    before_action :set_product
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = @product.comments.new(comment_params)
      @product =@comment.product
      
      if @comment.save
        
        respond_to do |format|
          format.json
        end
      else
        redirect_to root_path
      end
    end
    private
    def comment_params
      params.require(:comment).permit(:comment,:product_id)
    end
    def set_product
      @product = Product.find(params[:product_id])
    end
  
  
end
