class YoutubesController < ApplicationController

  def create
    @artist = current_user.artist
    @youtube = Youtube.new(youtube_params)
    @youtube.artist = @artist
    if
      @youtube.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    @artist = current_user.artist
    @youtube = @artist.youtube
    @youtube.destroy
    redirect_to artists_path
  end

  private

  def youtube_params
    params.require(:youtube).permit(:link)
  end
end
