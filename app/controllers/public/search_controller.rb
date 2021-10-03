class Public::SearchController < ApplicationController

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @target = params["search"]["target"]
    shops = search_for(@how, @value, @target)
    @shops = shops.page(params[:page]).per(1)
  end

  private

  def match(value, target)
    if target == "area"
      Shop.where(area_id: value)
    elsif target == "atmosphere"
      Shop.where(atmosphere_id: value)

    elsif value == "name"
      Shop.where(name: value)
    end
  end

  def partical(value)
    Shop.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value, target)
    if how == 'match'
      match(value, target)
    else
      partical(value)
    end
  end

end
