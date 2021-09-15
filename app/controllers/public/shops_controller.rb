class Public::ShopsController < ApplicationController
  
  def index
    @shops = Shop.all
  end
  
  def show
    @comment = Comment.new
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.order(created_at: :desc)#:desc = 降順
  end
  
end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :comment_id, :atmosphere_id, :status, :product_id)
  end