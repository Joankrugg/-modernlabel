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
    @geojson = Array.new

    @places.each do |place|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [place.longitude, place.latitude]
        },
        properties: {
          name: place.name,
          address: place.address,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat
  end
end
