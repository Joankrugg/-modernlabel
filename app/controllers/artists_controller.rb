class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :signed]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @artists = Artist.perform_search(params[:search]).paginate(page: params[:page], per_page: 4)
    else
      @artists = Artist.all.paginate(:page => params[:page], :per_page => 4)
    end
  end

  def signed
    @artists = Artist.where(signed: true).paginate(:page => params[:page], :per_page => 4)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.build_artist(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show

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
    @artist.destroy
    redirect_to artists_path
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :description, :photo, :photo_cache, :year_of_creation, :city, :number_of_musicians, :facebook_link, :insta_link, :youtube_channel, :soundcloud_link, :twitter_link, :bandcamp_link, :user_id, :genre_id, :mp3)
  end
end
