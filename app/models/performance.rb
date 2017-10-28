class Performance < ApplicationRecord
  belongs_to :artist, required: true
  include PgSearch
  scope :sorted, ->{ order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    :place_address,
                    :city,
                    :start_time,
                  ],
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
