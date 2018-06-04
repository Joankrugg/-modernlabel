class Asso < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :genre
  belongs_to :activity
  belongs_to :county
  belongs_to :activity_class
  mount_uploader :photo, PhotoUploader
  has_many :videos, dependent: :destroy
  has_many :performances, dependent: :destroy
  has_many :services, dependent: :destroy

  validates :activity_class, presence: true
  validates :name, uniqueness: true, presence: true
  validates :photo, presence: true
  validates :number_of_musicians_max, presence: true
  validates :city, presence: true
  validates :genre, presence: true
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
                    genre: [:name],
                    activity: [:name]
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

