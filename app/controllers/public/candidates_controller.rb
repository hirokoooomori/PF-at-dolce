class Public::CandidatesController < ApplicationController
  
  def create
    shop = Shop.find(params[:shop_id])
    candidate = current_customer.candidates.new(shop_id: shop.id)
    candidate.save
    redirect_to(request.referer)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    candidate = current_customer.candidates.find(params[:id])
    candidate.destroy
    redirect_to(request.referer)
  end
  
end
