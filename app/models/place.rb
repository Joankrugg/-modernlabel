class Place < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  has_many :performances
  has_many :videos
  has_many :hardwares
  mount_uploader :photo, PhotoUploader
  validates :name, uniqueness: true, presence: true
  validates :photo, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :genre, presence: true
  validates :facebook_page, uniqueness: true, presence: true, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/?/ }

  include PgSearch
  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    :name,
                    :city,
                  ],
                  associated_against: {
                    genre: [:name]
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
