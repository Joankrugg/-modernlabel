class HardwaresController < ApplicationController
before_action :set_hardware, only: [:show, :edit, :update, :destroy]

  def new
    @place = current_user.place
    @hardware = Hardware.new
  end

  def create
    @place = current_user.place
    @hardware = @place.hardwares.new(hardware_params)
    @hardware.place = @place

    if
      @hardware.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end
  def show

  end

  def edit

  end

  def update
    if @hardware.update(hardware_params)
      redirect_to hardware_path(@hardware)
    else
      render :edit
    end
  end

  def destroy
    @hardware.destroy
    redirect_to places_path
  end

  private

  def set_hardware
    @hardware = Hardware.find(params[:id])
  end

  def hardware_params
    params.require(:hardware).permit(:name, :place_id, :description, :number, :photo, :photo_cache)
  end
end
