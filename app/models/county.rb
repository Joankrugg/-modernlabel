class County < ApplicationRecord
  has_many :artists
  has_many :assos
  has_many :places
end
