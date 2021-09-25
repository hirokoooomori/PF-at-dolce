class Admin::FaqsController < ApplicationController

    def new
      @contact = Contact.find(params[:contact_id])
      @frequently = @contact.message
      @faq = Faq.new
    end
    
    def index
      @faqs =Faq.all
      @contact = Contact.find(params[:contact_id])
    end

    def create
      @faq = Faq.new(faq_params)
      @faq.admin_id = current_admin.id
      @faq.contact_id = params[:contact_id]
      if @faq.save
        flash[:notice] = "登録完了"
        redirect_to admin_contact_faqs_path(params[:contact_id])
      else
        @contact = Contact.find(params[:contact_id])
        @frequently = @contact.message
        render :new
      end
    end

    def edit
      @faq = Faq.find(params[:id])
    end

    def destroy
      @faq = Faq.find(params[:id])
      @faq.destroy
      redirect_to admin_contact_faqs_path(contact.id)
    end

 private

    def faq_params
      params.require(:faq).permit(:frequently, :question, :admin_id, :contact_id)
    end


end
