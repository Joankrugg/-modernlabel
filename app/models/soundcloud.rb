class Soundcloud < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?soundcloud.com\/?/ }, allow_blank: true
end
