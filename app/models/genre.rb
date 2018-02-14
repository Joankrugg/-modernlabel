class Genre < ApplicationRecord
  has_many :artists
  has_many :releases
  has_many :assos
  has_many :places
end
