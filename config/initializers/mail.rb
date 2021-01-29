Rails.application.configure do

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            ENV["GMAIL_NAME"],
    password:             ENV["GMAIL_PASS"],
    authentication:       'plain',
    enable_starttls_auto: true
  }

end
