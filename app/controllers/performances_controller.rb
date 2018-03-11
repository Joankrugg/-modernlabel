class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_performance, only: [:show, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @performances = Performance.perform_search(params[:search]).paginate(page: params[:page], per_page: 4)
    else
      @performances = Performance.all.paginate(page: params[:page], per_page: 4)
    end
  end

  def new
    @artist = current_user.artist
    @performance = Performance.new
  end

  def create
    @artist = current_user.artist
    @performance = @artist.performances.new(performance_params)
    @performance.artist = @artist
    if @performance.save
      redirect_to artist_path(@artist)
    else
      render 'artists/show'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @performance.update(performance_params)
      redirect_to performance_path(@performance)
    else
      render :edit
    end
  end
  def destroy
    @performance.destroy
    redirect_to performances_path
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:start_time, :place_address, :city, :photo, :photo_cache, :artist_id, :facebook_event, :user_id, :name, :end_time, :price)
  end
end
