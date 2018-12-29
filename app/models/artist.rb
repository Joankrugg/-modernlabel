class Artist < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  belongs_to :county
  has_many :performances, dependent: :destroy
  has_many :releases, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_one :instagram, dependent: :destroy
  has_one :soundcloud, dependent: :destroy
  has_one :twitter, dependent: :destroy
  has_one :youtube, dependent: :destroy
  has_one :bandcamp, dependent: :destroy
  has_one :facebook, dependent: :destroy
  has_one :bio, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :contacts
  has_many :instrument_hirings
  has_many :instruments, through: :instrument_hirings

  validates :name, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :genre, presence: true
  validates :number_of_musicians, presence: true
  validates :photo, presence: true

  has_attachment :mp3
  mount_uploader :photo, PhotoUploader

  def address
    city
  end

  geocoded_by :address
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
                    genre: [ :name],
                    county: [ :name]
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

