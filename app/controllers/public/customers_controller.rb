class Public::CustomersController < ApplicationController

  def create
    @customer = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      render :new
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.order("created_at DESC")
    @favorites = @customer.favorites
    @candidates = @customer.candidates
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :show
    end
  end

  def quit
  end

  private
  
  def customer_params
    params.require(:customer).permit(:email, :image, :name)
  end

end