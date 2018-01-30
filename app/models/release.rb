class Release < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
  belongs_to :genre, required: true
  belongs_to :artist, required: true
  mount_uploader :photo, PhotoUploader
  validates :description, presence: true
  validates :price, presence: true
  validates :year_of_creation, presence: true
  validates :youtube_link, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// }, allow_blank: true
  validates :bandcamp_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?bandcamp.com\/?/ }, allow_blank: true
  has_attachment :mp3

  include PgSearch
  scope :sorted, ->{ order(title: :asc) }

  pg_search_scope :search,
                  against: [
                    :title,
                    :price,
                    :year_of_creation
                  ],
                  associated_against: {
                  artist: [ :name ],
                  genre: [ :name ],
                  record: [ :name ]
                  },
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  def self.perform_search(keyword)
    if keyword.present?
    then Release.search(keyword)
    else Release.all
    end.sorted
  end
end
