class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @videos = Video.perform_search(params[:search]).paginate(page: params[:page], per_page: 4)
    else
      @videos = Video.all.paginate(page: params[:page], per_page: 4)
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
    if
      @asso = current_user.asso
      @video = @asso.videos.new(video_params)
      @video.asso = @asso

    else
      @artist = current_user.artist
      @video = @artist.videos.new(video_params)
      @video.artist = @artist

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
    params.require(:video).permit(:title, :youtube_link, :artist_id, :genre_id, :asso_id)
  end
end
