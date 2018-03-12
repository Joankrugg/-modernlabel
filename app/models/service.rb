class Service < ApplicationRecord
  belongs_to :asso
  mount_uploader :photo, PhotoUploader
end
