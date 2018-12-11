class Instagram < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?instagram.com\/?/ }, allow_blank: true
end
