class Public::ShopsController < ApplicationController

  def index
    @shops = Shop.all
    #candidate = Candidate.find(params[:id])
  end

  def show
    @comment = Comment.new
    @shop = Shop.find(params[:id])
    @comments = @shop.comments.order(created_at: :desc)#:desc = 降順
  end

end

  private

  def shop_params
    eat_in = params[:status][:eat_in].present? ? params[:status][:eat_in] : "0"
    take_out = params[:status][:take_out].present? ? params[:status][:take_out] : "0"
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :comment_id, :atmosphere_id, :status, :product_id)
  end