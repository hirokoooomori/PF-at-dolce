class Public::FaqsController < ApplicationController
    
    def index
    end
    
    def new
      @faq = Faq.new
    end
    
end
