ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.zoho.com",
  :port                 => 465,
  :domain               => 'woomatch.com',
  :user_name            => "admin@woomatch.com",
  :password             => "qqqqqqqw",
  :authentication       => :login,
  :ssl                  => true,
  :tls                  => true,
  :content_type         => "text/html",
  :enable_starttls_auto => true
}