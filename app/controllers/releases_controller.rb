class ReleasesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :signed]
  before_action :set_release, only: [:show, :edit, :update]
  def index
    if params[:search].present?
      @releases = Release.perform_search(params[:search]).paginate(page: params[:page], per_page: 8)
    else
      @releases = Release.all.paginate(page: params[:page], per_page: 8)
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
