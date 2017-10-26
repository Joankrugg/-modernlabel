class Performance < ApplicationRecord
  belongs_to :artist, required: true
  def self.search(search)
    if search
      where("city ILIKE ?", "%#{search.downcase.capitalize}%")
    else
      all
    end
  end
end
