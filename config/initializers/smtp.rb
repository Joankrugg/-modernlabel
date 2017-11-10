  config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'modernboxrecords.com',
  user_name: ENV['GMAIL_ADDRESS'],
  password: ENV['GMAIL_APP_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
