ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
	:port => 587,
	:authentication => :plain,
	:domain => ENV['CHATTDRAIN_SMTP_USER'],
	:user_name => ENV['CHATTDRAIN_SMTP_USER'],
	:password => ENV['CHATTDRAIN_SMTP_PASSWORD']
}
