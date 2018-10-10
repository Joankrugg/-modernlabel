class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :concept]

  def home
    @actus = Actu.where(billboard: true)
    @artists = Artist.where(signed: true).sample(4)
    @releases = Release.where(signed: true).sample(4)
    @videos = Video.all.sample(4)
  end

  def concept
    @artists = Artist.where(signed: true).sample(4)
    @releases = Release.where(signed: true).sample(4)
  end
end
