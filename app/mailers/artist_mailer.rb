class ArtistMailer < ApplicationMailer

  def creation_confirmation(artist)
    @artist = artist # Instance variable => available in view

    mail(
      to: @artist.user.email,
      subject: 'you successfully created an artist')
  end

  def contact_artist(contact)
    @contact = contact
    mail(to: @contact.artist.user.email, subject: @contact.user.email + ' voudrait enter en contact avec vous')
  end

end
