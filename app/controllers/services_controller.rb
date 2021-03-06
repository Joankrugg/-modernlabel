class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def new
    @asso = current_user.asso
    @service = Service.new
  end

  def create
    @asso = current_user.asso
    @service = @asso.services.new(service_params)
    @service.asso = @asso

    if
      @service.save
      redirect_to asso_path(@asso)
    else
      render :new
    end
  end
  def show

  end

  def edit

  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to assos_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :asso_id, :adhesion_fee, :photo, :photo_cache)
  end
end


