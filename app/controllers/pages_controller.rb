class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :introduction]

  def home
    @actus = Actu.where(billboard: true)
  end

  def introduction
    @artists = Artist.all.sample(4)
    @releases = Release.all.sample(4)
  end
end
