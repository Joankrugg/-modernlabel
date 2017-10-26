class PerformancesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_performance, only: [:show, :edit, :update]
  def index
    @performances = Performance.search(params[:search])
  end

  def new
    @artist = current_user.artist
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to performance_path(@performance)
    else
      render :new
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

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:start_time, :place_address, :city, :artist_id, :facebook_event, :user_id)
  end
end
