class Performance < ApplicationRecord
  belongs_to :user, required: true
  mount_uploader :photo, PhotoUploader
end
