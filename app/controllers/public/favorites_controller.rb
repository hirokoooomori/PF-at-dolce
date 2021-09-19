class Public::FavoritesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.new(shop_id: @shop.id)
    favorite.save
    @shop = favorite.shop
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.find(params[:id])
    favorite.destroy
    @shop = favorite.shop
  end

  private

  def shop_params
    @shop = Shop.find(params[:id])
  end

end