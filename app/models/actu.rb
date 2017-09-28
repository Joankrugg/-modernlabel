class Actu < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :edition, presence: true
end
