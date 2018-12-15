class Contact < ApplicationRecord
  belongs_to :artist, required: true
  belongs_to :user, required: true


  after_create :send_artist_contact


  private

  def send_artist_contact
    ArtistMailer.contact_artist(self).deliver_now
  end


end
