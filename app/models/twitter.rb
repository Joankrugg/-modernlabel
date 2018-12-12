class Twitter < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?twitter.com\/?/ }, allow_blank: true
end
