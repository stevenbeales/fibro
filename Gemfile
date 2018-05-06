# frozen_string_literal: true

source 'https://rubygems.org'
ruby ENV['CUSTOM_RUBY_VERSION'] || '2.4.4'

gem 'activerecord', '>= 5.2' # ORM
gem 'audited', '>= 4.7', require: false # adds table auiting support
gem 'bugsnag', '>= 6.6', require: false # online bug reporting
gem 'bundler-audit', '>= 0.6', require: false # check gems for security issues
gem 'default_value_for', '>= 3.0', require: false # set default values
gem 'discard', '>= 1.0', require: false # soft deletes
gem 'dotenv', '>= 2.2', require: false # adds environment variables from .env files
gem 'goldiloader', '>= 2.1', require: false # automatic eager loading
gem 'i18n', '>= 1.0', require: false # internationalization support
gem 'nokogiri', require: false # HTML parsing
gem 'pg', '>= 1.0', require: false # for Postgres
gem 'puma', '>= 3.11', require: false # puma web server
gem 'rack-heartbeat', '>= 1.1', require: false # provide heartbeat URL
gem 'rack-timeout', '>= 0.4', require: false # configure Rack timeout
gem 'rake', '>= 12.3', require: false # so we can run Rake tasks
gem 'ralyxa', '>= 1.7', require: false # Ralyxa framework to handle Alexa requests
gem 'sinatra', '>= 2.0', require: false # Web server
gem 'sinatra-activerecord', '>= 2.0', require: false # for Active Record models
gem 'sinatra-initializers', '>= 0.1', require: false # config initializers for sinatra
gem 'strong_migrations', '>= 0.2', require: false # check migrations for unsafe production operations
gem 'valid_email2', '>= 2.2', require: false # validates email format
gem 'validates_timeliness', '>= 4.0', require: false # validate dates and times

group :test do
  gem 'database_cleaner', '>=1.6', require: false # for test database cleaning
  gem 'factory_bot', '>= 4.0', require: false # for test data setup
  gem 'fuubar', '>= 2.3', require: false # rspec formatter
  gem 'rack-test', '>= 1.0', require: false # for testing rake servers
  gem 'rspec', '>= 3.7', require: false # for behavioral driven testing
  gem 'ruby_audit', '>= 1.2', require: false # complements bundler-audit
  gem 'simplecov', '>= 0.16', require: false # for code coverage
  gem 'simplecov-console', '>= 0.4', require: false # code coverage to console
  gem 'travis', '>= 1.8', require: false # for continuous integrations
  gem 'warning', '>= 0.1', require: false # customize warnings
end

group :development, :test do
  gem 'better_errors', '>= 2.4', require: false # better error logging
  gem 'binding_of_caller', '>= 0.8', require: false # helps better_errors provide more detailed debugging
  gem 'bullet', '>= 5.7', require: false # find slow ActiveRecord queries
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '>= 10.0', platforms: %i[mri mingw x64_mingw]
  gem 'fasterer', '>= 0.4', require: false # find slow code
  gem 'overcommit', '>= 0.4', require: false # git hooks
  gem 'reek', '>= 4.8', require: false # find code smells
  gem 'rubocop', '>= 0.5', require: false # syntax checking
  gem 'timecop', '>= 0.9', require: false # testing time dependent
end

group :doc do
  gem 'sdoc', '>= 1.0', require: false # static documentation
end

group :production, :test do
  gem 'rack-ssl', '>= 1.4', require: false # ssl for rack in production
end

group :windows do
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', '>= 1', require: false if Gem.win_platform?
  gem 'win32console', '>= 1.3 ', require: false if Gem.win_platform? # color code coverage
end
