# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
   :user_name => "costcommander@gmail.com",
   :password => "QJFUIaSyBWrRAcvP",
   :domain => "yourdomain.com",
   :address => "smtp-relay.sendinblue.com",
   :port => 587,
   :authentication => :plain,
   :enable_starttls_auto => true
 }