class Public::CommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    comment = Comment.new(comment_params)
    comment.shop_id = @shop.id
    comment.customer_id = current_customer.id
    comment.image_id = @image_id
    comment_count = Comment.where(shop_id: params[:shop_id]).where(customer_id: current_customer.id).count

    if comment.valid?
      if comment_count < 1
        comment.save
        redirect_to shop_path(@shop), notice: "レビューを投稿しました"
      else
        redirect_to shop_path(@shop), notice: "レビューの投稿は一度までです"
      end
    else
      flash.now[:alert] = 'コメントを入力してください'
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
    params.require(:comment).permit(:comment, :image, :shop_id, :rate)
  end

end
