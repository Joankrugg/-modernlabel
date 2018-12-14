class BandcampsController < ApplicationController

  def create
    @artist = current_user.artist
    @bandcamp = Bandcamp.new(bandcamp_params)
    @bandcamp.artist = @artist
    if
      @bandcamp.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  private

  def bandcamp_params
    params.require(:bandcamp).permit(:link)
  end
end
