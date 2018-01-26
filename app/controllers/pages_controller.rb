class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @artists = Artist.all.sample(4)
    @releases = Release.all.sample(4)
  end
end
