class Release < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
  mount_uploader :photo, PhotoUploader
end
