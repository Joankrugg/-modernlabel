class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @places = Place.perform_search(params[:search])
    else
      @places = Place.all
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.build_place(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def show
    @performance = Performance.new
    @video = Video.new
    @hardware = Hardware.new
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :photo, :photo_cache, :city, :facebook_page, :user_id, :genre_id, :address)
  end
end
