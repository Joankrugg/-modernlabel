class Artist < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
  validates :number_of_musicians, presence: true
  validates :facebook_link, uniqueness: true, presence: true
  validates :insta_link, uniqueness: true
  mount_uploader :photo, PhotoUploader
  belongs_to :users, required: true
end
