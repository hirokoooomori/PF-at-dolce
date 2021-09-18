class Admin::ShopsController < ApplicationController

  def index
    @shops = Shop.all

    # params[:status].each do | di1,di2 |
    #   if di2 == "1"
    #     @status = Status.new(status:di1)
    #     @status.save
    #   end
    # end
    #redirect_to admin_shops_path
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
    eat_in = params[:status][:eat_in].present? ? params[:status][:eat_in] : "0"
    take_out = params[:status][:take_out].present? ? params[:status][:take_out] : "0"
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :atmosphere_id, :atmosphere).merge(eat_in: eat_in, take_out: take_out)
  end