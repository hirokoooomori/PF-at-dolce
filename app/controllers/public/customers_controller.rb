class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.order("created_at DESC")
    #favorite = favorite.shop.id
    @favorites = @customer.favorites
    @candidates = @customer.candidates
    #@favorites = Favorite.where(shop_id: @shop.id)
    #@favorites_shop = Customer.find_by(id: @favorites.shop_id)
  end

  def edit
  end

  def quit
  end

end

private

def customer_params
  params.require(:customer).permit(:email, :image, :name)
end