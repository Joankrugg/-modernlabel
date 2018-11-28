class Place < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  has_many :performances, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :hardwares, dependent: :destroy
  belongs_to :county
  belongs_to :activity_class

  mount_uploader :photo, PhotoUploader
  validates :name, uniqueness: true, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :address, presence: true
  validates :genre, presence: true
  validates :photo, presence: true
  validates :number_of_musicians_max, presence: true
  validates :activity_class, presence: true
  validates :facebook_page, uniqueness: true, presence: true, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/?/ }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  include PgSearch
  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    :name,
                    :city,
                  ],
                  associated_against: {
                    genre: [:name],
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
    then Place.search(keyword)
    else Place.all
    end.sorted
  end

end
