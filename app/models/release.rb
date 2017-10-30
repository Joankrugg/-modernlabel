class Release < ApplicationRecord
  belongs_to :user, required: true
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
  belongs_to :genre, required: true
  belongs_to :artist
  mount_uploader :photo, PhotoUploader
  validates :description, presence: true
  validates :price, presence: true
  validates :year_of_creation, presence: true
  validates :youtube_link, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// }
  validates :bandcamp_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?bandcamp.com\/?/ }

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
