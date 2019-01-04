class Activity < ApplicationRecord
  has_many :assos
  has_many :users, through: :user_activities
  has_many :user_activities
end
