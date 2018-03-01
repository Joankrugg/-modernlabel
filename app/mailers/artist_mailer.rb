class ArtistMailer < ApplicationMailer
  def creation_confirmation(artist)
    @artist = artist # Instance variable => available in view

    mail(
      to: @artist.user.email,
      subject: 'you successfully created an artist')
  end
end
