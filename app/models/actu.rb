class Actu < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :edition, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :photo, presence: true
  validates :description, presence: true
end
