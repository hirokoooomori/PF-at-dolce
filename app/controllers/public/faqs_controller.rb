class Public::FaqsController < ApplicationController

    def index
       @faqs =Faq.all
    end

    def new
      @faq = Faq.new
    end

end
