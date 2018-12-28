class Genre < ApplicationRecord
  has_many :artists
  has_many :releases
  has_many :assos
  has_many :places
  has_many :videos
  has_many :user_genres
  has_many :users, through: :user_genres
end
