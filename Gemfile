source 'https://rubygems.org'

# Set a fixed Ruby version
ruby '2.3.1'

# Core Rails stuff

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use Passenger as the Rails server
gem 'passenger'
# Use PostgreSQL as the database for Active Record
gem 'pg'

# Nice-to-have tweaks

# Less verbose logging
gem 'lograge'
# Better error pages when stuff breaks
gem 'better_errors'

# Frontend

# Use Slim for templating
gem 'slim-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap for page layout
gem 'bootstrap-sass'
# Simplifies building Bootstrap forms in Rails
gem 'bootstrap_form'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# JBuilder generates awesome JSON interfaces
gem 'jbuilder'

# Backend

# User auth and management
gem 'devise'
# Access control
gem 'pundit'
# Admin interface
gem 'rails_admin'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Utility

# Random data for tests and seeds
gem 'faker'
# Factory creation instead of fixtures for test data
gem 'factory_girl_rails'
# Live debugging in web REPL
gem 'binding_of_caller'
# Better `rails c`
gem 'pry'

# Target-specific

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Open emails in the browser
  gem 'letter_opener'
end

group :production do
  gem 'rails_12factor'
end
