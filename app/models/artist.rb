class Artist < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  has_many :performances
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
  validates :number_of_musicians, presence: true
  validates :facebook_link, uniqueness: true, presence: true
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

