class FacebooksController < ApplicationController

  def create
    @artist = current_user.artist
    @facebook = Facebook.new(facebook_params)
    @facebook.artist = @artist
    if
      @facebook.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  private

  def facebook_params
    params.require(:facebook).permit(:link)
  end
end
