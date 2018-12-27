class ArtistMailer < ApplicationMailer

  def creation_confirmation(artist)
    @artist = artist # Instance variable => available in view

    mail(
      to: @artist.user.email,
      subject: 'Tu as créé un compte artiste dans modernboxrecords')
  end

  def contact_artist(contact)
    @contact = contact
    mail(to: @contact.artist.user.email, subject: @contact.user.email + ' voudrait entrer en contact avec vous')
  end

  def message_artist(message)
    @message = message
    mail(to: @message.artist.user.email, subject: @message.user.email + ' vous a envoyé un message sur modernboxrecords')
  end

end
