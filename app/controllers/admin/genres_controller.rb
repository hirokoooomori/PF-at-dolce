class Admin::GenresController < ApplicationController

  def index
    @areas = Area.all
    @area = Area.new
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @area.save
    redirect_to request.referer
  end

  private
  def area_params
    params.require(:area).permit(:name)
  end


end
