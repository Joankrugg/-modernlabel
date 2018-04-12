class Performance < ApplicationRecord
  belongs_to :artist
  belongs_to :type
  belongs_to :asso
  belongs_to :place
  mount_uploader :photo, PhotoUploader
  include PgSearch
  scope :sorted, ->{ order(city: :asc) }

  pg_search_scope :search,
                  against: [
                    :city,
                    :price
                  ],
                  associated_against: {
                  artist: [ :name ]
                  },
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  def self.perform_search(keyword)
    if keyword.present?
    then Performance.search(keyword)
    else Performance.all
    end.sorted
  end
end
