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
end

