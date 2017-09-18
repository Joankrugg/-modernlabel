class Release < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  belongs_to :record, required: true
end
