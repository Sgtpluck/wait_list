# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
HelpLine::Application.initialize!

HelpLine::Application.configure do 
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address              => "smtp.mandrillapp.com",
    :port                 => 587, # or 25
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name            => ENV["MANDRILL_UN"],
    :password             => ENV["MANDRILL_MAILER_KEY"],
    :authentication       => 'login' # Mandrill supports 'plain' or 'login'
  }
end