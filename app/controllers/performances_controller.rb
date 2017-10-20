class PerformancesController < ApplicationController
  before_action :set_perf, only: [:show, :edit, :update, :destroy]

  def index
    @performances = Performance.all
  end
  def new
    @performance = Performance.new
  end

  def create
    @performance = current_user.performances.new(performance_params)
    if @performance.save
      redirect_to current_user
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

  def destroy
    @performance = @performance.destroy
    redirect_to performances_path
  end


  private

  def set_perf
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:start_time, :city, :place_address, :price, :photo, :photo_cache, :facebook_event, :user_id)
  end


end

