class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :rock_map]

  def home
    @actus = Actu.where(billboard: true)
    @artists = Artist.where(signed: true).sample(4)
    @releases = Release.where(signed: true).sample(4)
    @videos = Video.all.sample(4)
  end

  def rock_map
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
    @artists = Artist.where.not(latitude: nil, longitude: nil)
    @artists.each do |artist|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [artist.longitude, artist.latitude]
        },
        properties: {
          name: artist.name,
          address: artist.address,
          :'marker-color' => '#E0422C',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end

    @assos = Asso.where.not(latitude: nil, longitude: nil)
    @assos.each do |asso|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [asso.longitude, asso.latitude]
        },
        properties: {
          name: asso.name,
          address: asso.address,
          :'marker-color' => '#64D045',
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
