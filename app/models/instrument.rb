class Instrument < ApplicationRecord
  has_many :instrument_playings
  has_many :users, through: :instrument_playings
  has_many :instrument_hirings
  has_many :artists, through: :instrument_hirings
end
