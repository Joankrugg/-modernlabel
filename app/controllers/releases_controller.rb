class ReleasesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_release, only: [:show, :edit, :update]
  def index
    if params[:search].present?
      @releases = Release.perform_search(params[:search])
    else
      @releases = Release.all
    end
  end

  def new
    @artist = current_user.artist
    @release = Release.new
  end

  def create
    @release = current_user.releases.new(release_params)
    if @release.save
      redirect_to release_path(@release)
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

  private

  def set_release
    @release = Release.find(params[:id])
  end

  def release_params
    params.require(:release).permit(:title, :record_id, :photo, :photo_cache, :description, :price, :year_of_creation, :youtube_link, :bandcamp_link, :user_id, :genre_id, :artist_id)
  end
end
