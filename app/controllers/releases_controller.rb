class ReleasesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :signed, :show]
  before_action :set_release, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @releases = Release.perform_search(params[:search])
    else
      @releases = Release.all
    end
  end

  def signed
    @releases = Release.where(signed: true)
  end

  def new
    @artist = current_user.artist
    @release = Release.new
  end

  def create
    @artist = current_user.artist
    @release = @artist.releases.new(release_params)
    @release.artist = @artist
    if @release.save
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
    if @release.update(release_params)
      redirect_to release_path(@release)
    else
      render :edit
    end
  end

  def destroy
    @release.destroy
    redirect_to releases_path
  end

  private

  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:title, :artist_id, :record_id, :genre_id, :photo, :photo_cache, :price, :year_of_creation, :description, :youtube_link, :bandcamp_link, :user_id, :production)
  end
end
