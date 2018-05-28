class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @videos = Video.perform_search(params[:search])
    else
      @videos = Video.all
    end
  end

  def signed
    @videos = Video.where(signed: true)
  end

  def new
    @artist = current_user.artist
    @video = Video.new
  end

  def create
      @artist = current_user.artist
      @video = @artist.videos.new(video_params)
      @video.artist = @artist
    if @video.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def create_as_an_asso
    if current_user.asso != nil
      @asso = current_user.asso
      @video = @asso.videos.new(video_params)
      @video.asso = @asso
    end

    if current_user.place != nil
      @place = current_user.place
      @video = @place.videos.new(video_params)
      @video.place = @place
    end

    if @video.save
      redirect_to video_path(@video)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @video.update(video_params)
      redirect_to video_path(@video)
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :youtube_link, :artist_id, :genre_id)
  end
end
