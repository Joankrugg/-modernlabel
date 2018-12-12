class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :signed, :show]
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @artists = Artist.perform_search(params[:search])

    else
      @artists = Artist.all
    end
  end

  def signed
    @artists = Artist.where(signed: true)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = current_user.build_artist(artist_params)
    if @artist.save
      ArtistMailer.creation_confirmation(@artist).deliver_now
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
    @rating = Rating.new
    @release = Release.new
    @performance = Performance.new
    @video = Video.new
    @instagram = Instagram.new
    @soundcloud = Soundcloud.new
    @twitter = Twitter.new
    @youtube =Youtube.new
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
    params.require(:artist).permit(:name, :bio, :photo, :photo_cache, :year_of_creation, :city, :number_of_musicians, :facebook_link, :insta_link, :youtube_channel, :soundcloud_link, :twitter_link, :bandcamp_link, :user_id, :genre_id, :mp3, :bookable, :contact, :county_id)
  end
end
