class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # This will render a view in `app/views/user_mailer`!
  end

  def long_time_no_see(date=DateTime.now)
    difference = (user.last_sign_in_at - date).to_i
    if difference > 20
      mail(to: @user.email, subject: 'long time no see')
    end
  end
end
