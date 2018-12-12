class Bandcamp < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?bandcamp.com\/?/ }, allow_blank: true
end
