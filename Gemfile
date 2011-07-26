source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'
gem 'coffee-script'
gem 'devise'
gem 'geokit'
gem 'haml', '~> 3.2.0.alpha'
gem 'therubyracer', :platforms => :ruby
gem 'uglifier'

platforms :jruby do
  gem 'jruby-openssl'
  gem 'therubyrhino'
end

group :development, :production do
  gem 'pg'
end

group :test do
  gem 'ZenTest'
  gem 'simplecov'
  gem 'sqlite3'
  gem 'turn', :require => false
  gem 'webmock'
end
