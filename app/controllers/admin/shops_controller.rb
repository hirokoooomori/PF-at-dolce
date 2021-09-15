class Admin::ShopsController < ApplicationController

  def index
    @shops = Shop.all

  end

  def new
    @shop = Shop.new
    # params[:status].each do | di1,di2 |
    #   if di2 == "1"
    #     @status = Status.new(status:di1)
    #     @status.save
    #   end
    # end
    # redirect_to admin_shops_path
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

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shops_path, notice: "更新しました"
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to admin_shops_path, notice: "削除しました"
  end

end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :atmosphere_id, :atmosphere, :status)
  end