class Artist < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  belongs_to :county
  has_many :performances, dependent: :destroy
  has_many :releases, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :videos, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :genre, presence: true
  validates :number_of_musicians, presence: true
  validates :photo, presence: true
  validates :year_of_creation, presence: true
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
                    :number_of_musicians,
                    :bookable
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


end

