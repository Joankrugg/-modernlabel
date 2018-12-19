class Artist::CreateFromFacebook
  def initialize(artist)
    @artist = artist
  end

  def call
    begin
      return false unless artist.facebook_page.present?

      key = artist.facebook_page[25..100].split("/")
      code = key[0]
      response = RestClient.get("https://graph.facebook.com/v3.0/#{code}?fields=id,name,about,artists_we_like,bio,fan_count,genre,hometown,emails,category,rating_count&access_token=#{'EAACEdEose0cBACY5yTArEUfugukqIadhHrfJKCiOFvvK8uo06yHcmceCZBZAijKkaovslcwFIX1WqrGBv7PyZAVA1KblmpOpGduscoz7Qci8xA8pLPPY3B0N59ZClboRKNyD9ZCUllSri1iEvu1gCfYYTyTZBGCBs4TeFcBCNXulgPY8DeNoaDwINdcPX33MnPOfKCc9BL1AZDZD'}")

      result = JSON.parse(response)

      puts result['id']
      artist.name = result['name']
      artist.county = "#{result['location']['zip']}"
      artist. result['genre']
      artist.city = result['hometown']
      artist. result['emails']
      artist. result['category']
      artist. result['rating_count']

      artist_data_json = RestClient.get("https://graph.facebook.com/v2.9/#{page_ref}?fields=name,about,description,price_range,fan_count,overall_star_rating,rating_count,location&access_token=#{ENV['YVON_ACCESS_TOKEN']}")
      artist_data = JSON.parse artist_data_json
      artist.fb_page_id = artist_data['id']
      artist.name ||= artist_data['name']
      artist.about = artist_data['about'] || artist_data['description'] || artist_data['name']
      artist.description = artist_data['description']
      artist.fb_price_range = artist_data['price_range']
      artist.fb_fan_count = artist_data['fan_count']
      artist.fb_overall_star_rating = artist_data['overall_star_rating']
      artist.fb_rating_count = artist_data['rating_count']
      artist.address ||= "#{artist_data['location']['street']}, #{artist_data['location']['zip']} #{artist_data['location']['city']}, #{artist_data['location']['country']}"
      return false unless artist.save

      artist_picture_data_json = RestClient.get("https://graph.facebook.com/v2.9/#{page_ref}/picture?width=480&redirect=0&access_token=#{ENV['YVON_ACCESS_TOKEN']}")
      artist_picture_data = JSON.parse artist_picture_data_json
      artist.photo_url = artist_picture_data['data']['url']
      true
    rescue
      false
    end
  end

  private

  attr_accessor :artist
end

