class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :concept]

  def home
    @actus = Actu.where(billboard: true)
    @artists = Artist.where(signed: true).sample(4)
    @releases = Release.where(signed: true).sample(4)
    @videos = Video.all.sample(4)
  end

  def concept
    @places = Place.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(partial: "/places/map_box", locals: { place: place })
    end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat
  end
end
