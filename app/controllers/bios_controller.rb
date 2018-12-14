class BiosController < ApplicationController

  def create
    @artist = current_user.artist
    @bio = Bio.new(bio_params)
    @bio.artist = @artist
    if
      @bio.save
      redirect_to artist_path(@artist)
    else
      redirect_to artist_path(@artist)
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:content)
  end
end
