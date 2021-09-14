class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]
    if @product.save
      flash[:notice] = "登録完了"
      redirect_to admin_shop_products_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_shop_products_path, notice: "削除しました"
  end

end

private

  def product_params
    params.require(:product).permit(:name, :image, :genre_id, :shop_id)
  end