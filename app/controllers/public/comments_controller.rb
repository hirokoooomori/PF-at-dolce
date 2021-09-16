class Public::CommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    comment = Comment.new(comment_params)
    comment.shop_id = @shop.id
    comment.customer_id = current_customer.id
    comment.image_id = @image_id
    if comment.save
      redirect_to shop_path(@shop)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    comment = @shop.comments.find(params[:id])
    
    if comment.customer != current_customer
      redirect_to request.referer
    end
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image, :shop_id)
  end

end
