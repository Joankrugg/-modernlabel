class Artist < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :year_of_creation, presence: true
  mount_uploader :photo, PhotoUploader
  belongs_to :users, required: true
end
