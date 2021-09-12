class Admin::ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "登録完了"
      redirect_to admin_shops_path(@shop)
    else
      render :new
    end
  end

end

def shop_params
  params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :atmosphere_id, :atmosphere)
end
