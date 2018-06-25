class Place::CreateFromFacebook
  def initialize(place)
    @place = place
  end

  def call
    begin
      return false unless place.facebook_page.present?

      key = place.facebook_page[25..100].split("/")
      code = key[0]
      response = RestClient.get("https://graph.facebook.com/v3.0/#{code}?fields=id,name,about,artists_we_like,bio,fan_count,genre,hometown,emails,category,rating_count&access_token=#{'EAACEdEose0cBACY5yTArEUfugukqIadhHrfJKCiOFvvK8uo06yHcmceCZBZAijKkaovslcwFIX1WqrGBv7PyZAVA1KblmpOpGduscoz7Qci8xA8pLPPY3B0N59ZClboRKNyD9ZCUllSri1iEvu1gCfYYTyTZBGCBs4TeFcBCNXulgPY8DeNoaDwINdcPX33MnPOfKCc9BL1AZDZD'}")

      result = JSON.parse(response)

      puts result['id']
      place.name = result['name']
      place.county = "#{result['location']['zip']}"
      place. result['artists_we_like']
      place.bio = result['bio']
      place. result['fan_count']
      place. result['genre']
      place.city = result['hometown']
      place. result['emails']
      place. result['category']
      place. result['rating_count']

      place_data_json = RestClient.get("https://graph.facebook.com/v2.9/#{page_ref}?fields=name,about,description,price_range,fan_count,overall_star_rating,rating_count,location&access_token=#{ENV['YVON_ACCESS_TOKEN']}")
      place_data = JSON.parse place_data_json
      place.fb_page_id = place_data['id']
      place.name ||= place_data['name']
      place.about = place_data['about'] || place_data['description'] || place_data['name']
      place.description = place_data['description']
      place.fb_price_range = place_data['price_range']
      place.fb_fan_count = place_data['fan_count']
      place.fb_overall_star_rating = place_data['overall_star_rating']
      place.fb_rating_count = place_data['rating_count']
      place.address ||= "#{place_data['location']['street']}, #{place_data['location']['zip']} #{place_data['location']['city']}, #{place_data['location']['country']}"
      return false unless place.save

      place_picture_data_json = RestClient.get("https://graph.facebook.com/v2.9/#{page_ref}/picture?width=480&redirect=0&access_token=#{ENV['YVON_ACCESS_TOKEN']}")
      place_picture_data = JSON.parse place_picture_data_json
      place.photo_url = place_picture_data['data']['url']
      true
    rescue
      false
    end
  end

  private

  attr_accessor :place
end
