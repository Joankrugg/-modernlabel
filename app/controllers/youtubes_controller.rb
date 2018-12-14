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

  private

  def youtube_params
    params.require(:youtube).permit(:link)
  end
end
