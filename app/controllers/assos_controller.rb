class AssosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_asso, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @assos = Asso.perform_search(params[:search]).paginate(page: params[:page], per_page: 4)
    else
      @assos = Asso.all.paginate(:page => params[:page], :per_page => 4)
    end
  end

  def new
    @asso = Asso.new
  end

  def create
    @asso = current_user.build_asso(asso_params)
    if @asso.save
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
    if @asso.update(asso_params)
      redirect_to asso_path(@asso)
    else
      render :edit
    end
  end

  def destroy
    asso.destroy
    redirect_to assos_path
  end


  private

  def set_asso
    @asso = Asso.find(params[:id])
  end

  def asso_params
    params.require(:asso).permit(:name, :city, :photo, :photo_cache, :facebook_page, :user_id, :genre_id)
  end
end
