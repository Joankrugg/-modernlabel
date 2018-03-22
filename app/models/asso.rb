class Asso < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  belongs_to :activity
  mount_uploader :photo, PhotoUploader
  has_many :videos, dependent: :destroy
  has_many :performances, dependent: :destroy
  has_many :services, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
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
    then Asso.search(keyword)
    else Asso.all
    end.sorted
  end
end

