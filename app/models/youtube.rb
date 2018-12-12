class Youtube < ApplicationRecord
  belongs_to :artist
  validates :link, format: { with: /(?:(?:http|https):\/\/)?(www\.youtube\.com|youtu\.?be)\// } , allow_blank: true
end
