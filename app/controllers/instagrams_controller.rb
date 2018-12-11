class InstagramsController < ApplicationController

  def create
    @artist = current_user.artist
    @instagram = Instagram.new(instagram_params)
    @instagram.artist = @artist
    if
      @instagram.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    @artist = current_user.artist
    @instagram = @artist.instagram
    @instagram.destroy
    redirect_to artists_path
  end

  private

  def instagram_params
    params.require(:instagram).permit(:link)
  end
end
