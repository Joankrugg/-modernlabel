class Release < ApplicationRecord
  belongs_to :user, required: true
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
  mount_uploader :photo, PhotoUploader
  validates :description, presence: true
  validates :price, presence: true
  validates :year_of_creation, presence: true
end
