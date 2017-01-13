source 'https://rubygems.org'

ruby '2.2.5'

gem 'rails', ' ~> 4.2.7' #patched for latest vulnerability
gem 'haml'
#gem 'devise' #user authenication library
gem 'kramdown'
gem 'bcrypt-ruby', ' ~> 3.0.0'
gem 'bootstrap-sass'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'friendly_id'
gem 'responders', '~> 2.0'

group :development, :test do
    gem 'rspec-rails'
    gem 'sqlite3'
    gem 'annotate'
end

group :test do
    gem 'capybara'
    #gem 'cucumber-rails'
    #gem 'cucumber-rails-training-wheels'
    gem 'database_cleaner'
    gem 'launchy'
    gem 'factory_girl_rails'
end

group :production do
    gem 'pg'
    gem 'newrelic_rpm'
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
    gem 'sass-rails'
    gem 'coffee-rails'
    gem 'compass'
    gem 'compass-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

gem 'jquery-rails'
gem 'puma'
