class Genre < ApplicationRecord
  has_many :artists
  has_many :releases
end
