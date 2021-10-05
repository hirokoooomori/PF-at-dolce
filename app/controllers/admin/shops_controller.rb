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

  def edit
    @shop = Shop.find(params[:id])
  end

  def update

    @shop = Shop.find(params[:id])
    # if eat_in.include? || take_out.include?
    #if status.include?
      @shop.update(shop_params)
      redirect_to admin_shops_path, notice: "更新しました"
    # else
    #   redirect_to request.refere, notice: "チェックボックスは1つ以上選択してください"
    # end
  end

  def destroy

    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to admin_shops_path, notice: "削除しました"
  end

  private

  def shop_params

    #eat_in = params[:status][:eat_in].present? ? params[:status][:eat_in] : "0"
    #take_out = params[:status][:take_out].present? ? params[:status][:take_out] : "0"
    params.require(:shop).permit(:name, :image, :business_day, :budget, :area_id, :atmosphere_id, :atmosphere, :eat_in, :take_out)
  end

end