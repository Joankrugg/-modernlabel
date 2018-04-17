class Hardware < ApplicationRecord
  belongs_to :place
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :number, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
