class Bio < ApplicationRecord
  belongs_to :artist
  validates :content, length: { minimum: 10,
    too_short: "%{count} characters is the minimum allowed" }
end
