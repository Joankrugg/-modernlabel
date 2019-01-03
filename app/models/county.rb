class County < ApplicationRecord
  has_many :artists
  has_many :assos
  has_many :places
  has_many :user_counties
  has_many :users, through: :user_counties
end
