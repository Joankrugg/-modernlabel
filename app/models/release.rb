class Release < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
  belongs_to :genre, required: true
  belongs_to :artist, required: true
  has_many :opinions, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :description, presence: true
  validates :price, presence: true
  validates :year_of_creation, presence: true
  validates :youtube_link, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// }, allow_blank: true
  validates :bandcamp_link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?bandcamp.com\/?/ }, allow_blank: true

  include PgSearch
  scope :sorted, ->{ order(title: :asc) }

  pg_search_scope :search,
                  against: [
                    :title
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

  def average_hearts
    heart_number = opinions.map{ |opinion| opinion.heart }.select{ |heart|!heart.nil? }
    opinion_number = heart_number.size > 0 ? heart_number.sum.fdiv(heart_number.size).round : 0
    ('<i class="fa fa-heart" aria-hidden="true"></i>' * opinion_number + '<i class="fa fa-heart-o" aria-hidden="true"></i>' * (5 - opinion_number)).html_safe
  end

end
