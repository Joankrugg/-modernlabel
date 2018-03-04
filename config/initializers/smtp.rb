ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address => ENV['MAILGUN_SMTP_SERVER'],
  :port => 587,
  :domain => "contact.modernboxrecords.com",
  :user_name => ENV['MAILGUN_SMTP_LOGIN'],
  :password => ENV['MAILGUN_SMTP_PASSWORD']
}


