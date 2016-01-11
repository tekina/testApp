source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Using postgreSQL as production DB for delpoyment on Heroku
group :production do
	gem 'rails_12factor'
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

#require 'active_support'

# For user authentication
gem 'devise'

group :test, :development do
	gem 'rspec'
	gem 'rspec-rails'
	gem 'rb-readline'
	gem 'factory_girl'
	gem 'factory_girl_rails'
#	gem 'shoulda-matchers'
	gem 'simplecov', '~> 0.7.1', require: false
	gem 'simplecov-rcov', require: false
	gem 'database_cleaner'
end

group :test do
	gem 'faker'
	gem 'capybara'
	gem 'selenium-webdriver'	#for testing js code
	gem 'guard'
 	gem 'guard-rspec'
 	gem 'launchy'
 	gem 'cucumber-rails', :require => false
# 	gem 'autotest'
# 	gem 'autotest-standalone'
end

# for coveralls badge
gem 'coveralls', require: false
 
# for bootstrap
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails', '~> 2.2.8'

# for creating forms
gem 'formtastic'

# for restricting user access
gem 'cancan'

#tokens for api login
gem 'simple_token_authentication'

# for getting rid of erb files
gem 'haml'
gem 'html2haml'
gem 'haml-rails'

# for twilio sms
gem 'twilio-ruby'

ruby "2.0.0"