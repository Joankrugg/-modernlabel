class ShopsController < ApplicationController

  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to shop_path(@shop)
  end

  def show
  end

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shop_path(@shop)
  end

  def destroy
  end


  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:product, :price, :description)
  end
end
