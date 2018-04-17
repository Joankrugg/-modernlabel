class Service < ApplicationRecord
  belongs_to :asso
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :adhesion_fee, presence: true
  validates :photo, presence: true
end
