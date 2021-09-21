class Public::SearchController < ApplicationController

  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @target = params["search"]["target"]

    @shops = search_for(@how, @value, @target)

  end

  private

  def match(value, target)
    if target == "area"
      Shop.where(area_id: value)
    elsif target == "atmosphere"
      Shop.where(atmosphere_id: value)
    #Shop.where(name: value)
    end
  end

  def partical(value)
    Shop.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value, target)
    case how
    when 'match'
      match(value, target)
    when 'partical'
      partical(value)
    end
  end

end
