class Public::CandidatesController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    candidate = current_customer.candidates.new(shop_id: @shop.id)
    candidate.save
    @shop = candidate.shop
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    candidate = current_customer.candidates.find(params[:id])
    candidate.destroy
    @shop = candidate.shop
  end

  private

  def shop_params
    @shop = Shop.find(params[:id])
  end

end
