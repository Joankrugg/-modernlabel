class TwittersController < ApplicationController

  def create
    @artist = current_user.artist
    @twitter = Twitter.new(twitter_params)
    @twitter.artist = @artist
    if
      @twitter.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  def destroy
    @artist = current_user.artist
    @twitter = @artist.twitter
    @twitter.destroy
    redirect_to artists_path
  end

  private

  def twitter_params
    params.require(:twitter).permit(:link)
  end
end
