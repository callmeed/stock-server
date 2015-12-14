source 'https://rubygems.org'

#########################################################
# Rails core
#########################################################
gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'dotenv-rails', :groups => [:development, :test]
#########################################################
# Database: if you want to use Postgres and/or Heroku,
# comment out mysql gem and use PG (below)
#########################################################
gem 'mysql2', '>= 0.3.13', '< 0.5'

#########################################################
# PG and Heroku
# Use these gems if you want to deploy to Heroku
#########################################################
gem 'pg', group: :production
gem 'rails_12factor', group: :production

#########################################################
# Webserver: use Puma & Foreman locally
# Also required for Heroku
#########################################################
gem 'puma'
gem 'foreman' 

#########################################################
# Boostrap and form stuff
#########################################################
gem 'bootstrap-sass', '~> 3.3.6'
gem 'font-awesome-rails'
gem 'bootstrap_form'

#########################################################
# Images
#########################################################
gem "refile", require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"

#########################################################
# Admin area
#########################################################
gem "administrate", "~> 0.1.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem "better_errors"
  gem "binding_of_caller"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby "2.2.2"
