class Message < ApplicationRecord
  belongs_to :artist
  belongs_to :user


  after_create :send_artist_message

  private

  def send_artist_message
    ArtistMailer.message_artist(self).deliver_now
  end

end
