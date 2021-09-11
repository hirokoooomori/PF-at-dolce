class Admin::GenresController < ApplicationController

  def index
    @areas = Area.all
    @area = Area.new
    @atmospheres =Atmosphere.all
    @atmosphere = Atmosphere.new
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @area.save
    redirect_to request.referer
    @atmosphere = Atmosphere.new(atmosphere_params)
    @atmosphere.save
    redirect_to request.reterer
  end

  private

  def area_params
    params.require(:area).permit(:name)
  end

  def atmosphere_params
    params.require(:atmosphere).permit(:name)
  end

end
