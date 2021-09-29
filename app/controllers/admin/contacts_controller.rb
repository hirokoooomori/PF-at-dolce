class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def contact_params
    params.require(:contact).permit(:name, :message, :customer_id)
  end

end
