class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @artists = Artist.all
  end

  def signed
    @artists = Artist.where(signed: true)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.artists.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @artist_coordinates = {lat: @artist.latitude, lng: @artist.longitude}
    @hash = Gmaps4rails.build_markers(@artist) do |artist, marker|
      marker.lat artist.latitude
      marker.lng artist.longitude
    end
  end

  def edit

  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artist = @artist.destroy
    redirect_to artists_path
  end


  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :description, :photo, :photo_cache, :year_of_creation, :city, :number_of_musicians, :facebook_link, :insta_link, :youtube_channel, :soundcloud_link, :twitter_link, :bandcamp_link, :user_id, :performances)
  end
end
