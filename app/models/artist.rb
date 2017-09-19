class Artist < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
