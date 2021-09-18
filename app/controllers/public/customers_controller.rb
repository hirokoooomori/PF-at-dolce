class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.order("created_at DESC")
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