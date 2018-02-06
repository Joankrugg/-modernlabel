class RatingsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.artist = Artist.find(params[:artist_id])
    if
      @rating.save
      redirect_to artists_path
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:beer, :crowd, :star, :crown, :artist_id)
  end
end
