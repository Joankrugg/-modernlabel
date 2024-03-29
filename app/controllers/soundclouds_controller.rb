class SoundcloudsController < ApplicationController

  def create
    @artist = current_user.artist
    @soundcloud = Soundcloud.new(soundcloud_params)
    @soundcloud.artist = @artist
    if
      @soundcloud.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  private

  def soundcloud_params
    params.require(:soundcloud).permit(:link)
  end
end
