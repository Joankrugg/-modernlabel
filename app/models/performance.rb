class Performance < ApplicationRecord
  belongs_to :artist, required: true
  include PgSearch
  scope :sorted, ->{ order(city: :asc) }

  pg_search_scope :search,
                  against: [
                    :place_address,
                    :city,
                    :start_time,
                  ],
                  associated_against: {
                  artist: [ :name ]
    }

  def self.perform_search(keyword)
    if keyword.present?
    then Performance.search(keyword)
    else Performance.all
    end.sorted
  end
end
