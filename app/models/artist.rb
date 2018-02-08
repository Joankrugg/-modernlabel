class Artist < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  has_many :performances, dependent: :destroy
  has_many :releases, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
  validates :number_of_musicians, presence: true
  validates :facebook_link, uniqueness: true, presence: true, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/?/ }
  validates :youtube_channel, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// } , allow_blank: true
  validates :insta_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?instagram.com\/?/ }, allow_blank: true
  validates :twitter_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?twitter.com\/?/ }, allow_blank: true
  validates :soundcloud_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?soundcloud.com\/?/ }, allow_blank: true
  has_attachment :mp3
  mount_uploader :photo, PhotoUploader
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
  include PgSearch
  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    :name,
                    :city,
                    :number_of_musicians
                  ],
                  associated_against: {
                    genre: [ :name]
                  },
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  def self.perform_search(keyword)
    if keyword.present?
    then Artist.search(keyword)
    else Artist.all
    end.sorted
  end

  def average_stars
    star_number = ratings.map{ |rating| rating.star }.select{ |star|!star.nil? }
    rating_number = star_number.size > 0 ? star_number.sum.fdiv(star_number.size).round : 0
    ('<i class="fa fa-star" aria-hidden="true"></i>' * rating_number + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - rating_number)).html_safe
  end

  def average_crowd
    crowd_size = ratings.map{ |rating| rating.crowd }.select{ |crowd|!crowd.nil? }
    rating_number = crowd_size.size > 0 ? crowd_size.sum.fdiv(crowd_size.size).round : 0
    ('<i class="fa fa-users" aria-hidden="true"></i>' * rating_number + '<i class="fa fa-users-o" aria-hidden="true"></i>' * (5 - rating_number)).html_safe
  end
  def average_beer
    beer_glass = ratings.map{ |rating| rating.beer }.select{ |beer|!beer.nil? }
    rating_number = beer_glass.size > 0 ? beer_glass.sum.fdiv(beer_glass.size).round : 0
    ('<i class="fa fa-beer" aria-hidden="true"></i>' * rating_number + '<i class="fa fa-beer-o" aria-hidden="true"></i>' * (5 - rating_number)).html_safe
  end

  def average_crown
    crown_number = ratings.map{ |rating| rating.crown }.select{ |crown|!crown.nil? }
    rating_number = crown_number.size > 0 ? crown_number.sum.fdiv(crown_number.size).round : 0
    ('<i class="fa fa-music" aria-hidden="true"></i>' * rating_number + '<i class="fa fa-music-o" aria-hidden="true"></i>' * (5 - rating_number)).html_safe
  end
end

