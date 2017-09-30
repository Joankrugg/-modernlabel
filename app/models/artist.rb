class Artist < ApplicationRecord
  belongs_to :user, required: true
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
  validates :number_of_musicians, presence: true
  validates :facebook_link, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader
  belongs_to :users, optional: true
end
