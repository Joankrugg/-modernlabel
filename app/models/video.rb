class Video < ApplicationRecord
  belongs_to :artist, required: true
  validates :title, presence: true
  validates :youtube_link, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// } , allow_blank: true
  include PgSearch
  scope :sorted, ->{ order(title: :asc) }

  pg_search_scope :search,
                  against: [
                    :title
                  ],
                  associated_against: {
                    artist: [ :name]
                  },
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  def self.perform_search(keyword)
    if keyword.present?
    then Video.search(keyword)
    else Video.all
    end.sorted
  end
end
