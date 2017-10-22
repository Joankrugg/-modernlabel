class Performance < ApplicationRecord
  belongs_to :artist, required: true
end
