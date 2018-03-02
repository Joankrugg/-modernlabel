class RatingsController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    @rating = Rating.new(rating_params)
    @rating.artist = @artist
    if @rating.save
      respond_to do |format|
        format.html { redirect_to artist_path(@artist)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'artists/show'}
        format.js
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:beer, :crowd, :star, :crown, :artist_id, :one_word)
  end
end
