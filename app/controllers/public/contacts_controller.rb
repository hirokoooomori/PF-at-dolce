class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  # 確認画面
  def confirm
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id
    if @contact.save
      redirect_to done_contacts_path
    else
      render :new
    end
  end

  # 送信完了画面
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end

end
