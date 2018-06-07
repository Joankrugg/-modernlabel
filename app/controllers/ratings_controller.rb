class RatingsController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    @rating = Rating.new(rating_params)
    @rating.artist = @artist
    if @rating.save
      redirect_to artist_path(@artist)
    else
      render 'artists/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:beer, :crowd, :star, :crown, :artist_id, :one_word)
  end
end
