class Artist < ApplicationRecord
  belongs_to :user, required: true
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
  def self.search(search)
    if search
      where("name ILIKE ?", "%#{search.downcase.capitalize}%")
    else
      all
    end
  end
end
