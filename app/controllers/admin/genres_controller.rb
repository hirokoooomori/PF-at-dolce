class Admin::GenresController < ApplicationController

  def index
    @areas = Area.all
    @area = Area.new
    @atmospheres =Atmosphere.all
    @atmosphere = Atmosphere.new
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @area = Area.new
  end

  def create
    if params[:area].present?
      @area = Area.new(area_params)
      @area.save
    redirect_to request.referer
    elsif params[:atmosphere].present?
      @atmosphere = Atmosphere.new(atmosphere_params)
      @atmosphere.save
      redirect_to request.referer
    else
      @genre = Genre.new(genre_params)
      @genre.save
      redirect_to request.referer
    end
  end
  
  def destroy
    
  end

end

  private


  def area_params
    params.require(:area).permit(:name)
  end

  def atmosphere_params
    params.require(:atmosphere).permit(:atmosphere)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end


