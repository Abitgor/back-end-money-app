source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

# Use postgresql as the database for Active Record
gem "pg"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"


gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false
gem 'secure_headers'
gem 'pundit'
gem 'pagy'
gem 'money-rails'
gem 'devise'
gem 'devise-jwt'
gem 'jwt'
gem 'jbuilder'
gem "image_processing"

group :development, :test do
  gem "rspec-rails"
  gem "rspec"
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-flexport', require: false
  gem 'rubocop-rspec'
  gem "annotate"
  gem 'active_record_query_trace' # Displays a backtrace for each query in Rails' development console and log
  gem 'brakeman', require: false
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'guard-jest'
  gem 'guard-minitest'
  gem 'guard-process'
  gem 'guard-rails'
  gem 'guard-rubocop'
  gem 'guard-yarn'
  gem 'pdf-inspector'
  gem 'pry-byebug'
  gem 'pry-rails' # Pry on rails console
  gem 'rb-readline'
  gem 'database_cleaner'
end

group :development do
  gem "spring"
  gem 'ffi-geos'
  gem 'bullet' # Warns for N+1 query
  gem 'foreman'
  gem 'github-markup' # source code scanning for consistent style and code mistakes
  gem 'letter_opener' # opens generated emails in a new browser tab
  gem 'listen'
  gem 'mry', require: false # gem for upgrading the rubocop configuration when necessary, see https://github.com/pocke/mry
  gem 'rails-erd' # For creating a db entity-relationship diagram
  gem 'rb-fsevent'
  gem 'redcarpet'
  gem 'ruby_kml'
  gem 'web-console'
end

group :test do
  gem 'climate_control'
  gem 'faker' # Faker Gem for tests
  gem 'mocha', require: false
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-context'
  gem 'shoulda-matchers'
  gem 'site_prism'
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
  gem 'simplecov'
end

