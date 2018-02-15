class ActusController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_actu, only: [:show, :edit, :update, :destroy]
  def index
    @actus = Actu.all
  end

  def new
    @actu = Actu.new
  end

  def create
    @actu = Actu.new(actu_params)
    @actu.save
    redirect_to actu_path(@actu)
  end

  def show

  end

  def edit

  end

  def update
    @actu.update(actu_params)
    redirect_to actu_path(@actu)
  end

  def destroy
    @actu = Actu.destroy
    redirect_to actus_path
  end


  private

  def set_actu
    @actu = Actu.find(params[:id])
  end

  def actu_params
      params.require(:actu).permit(:title, :content, :photo, :photo_cache, :edition, :link, :description, :billboard)
  end
end
