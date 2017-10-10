class PerformancesController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @performance = Performance.new
  end


  def create
    @performance = Performance.new(performance_params)
    @performance.artist = Artist.find(params[:artist_id])
    @performance.save
    redirect_to artist_path
  end

  private

  def performance_params
    params.require(:performance).permit(:start_time, :end_time, :artist_id)
  end


end

