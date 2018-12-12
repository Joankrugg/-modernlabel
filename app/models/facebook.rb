class Facebook < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/?/ }
end
