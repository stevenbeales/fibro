# frozen_string_literal: true

source 'https://rubygems.org'
ruby ENV['CUSTOM_RUBY_VERSION'] || '2.4.4'

gem 'activerecord', '>= 5.2', require: false # ORM
gem 'activerecord-safer_migrations', '>= 2.0', require: false # Lock timeouts for migrations
gem 'alexa_generator', '>= 0.3', require: false # Alexa utterance generator
gem 'alexa_ruby', '>= 1.5', require: false # Fork of Alexa RubyKit
gem 'alexa_web_service', '>= 1.0', require: false # Alexa Web Service support
gem 'audited', '>= 4.7', require: false # adds table auiting support
gem 'bugsnag', '>= 6.6', require: false # online bug reporting
gem 'bundler-audit', '>= 0.6', require: false # check gems for security issues
gem 'concord', '>= 0.1.5', require: false # easier class composition
gem 'default_value_for', '>= 3.0', require: false # set default values
gem 'discard', '>= 1.0', require: false # soft deletes
gem 'dotenv', '>= 2.2', require: false # adds environment variables from .env files
gem 'goldiloader', '>= 2.1', require: false # automatic eager loading
gem 'httparty', '>= 0.16', require: false # parse html
gem 'i18n', '>= 1.0', require: false # internationalization support
gem 'natter', '>= 0.1.7', require: false # utterance parser
gem 'pg', '>= 1.0', require: false # for Postgres
gem 'puma', '>= 3.11', require: false # puma web server
gem 'rake', '>= 12.3', require: false # so we can run Rake tasks
gem 'ruby_audit', '>= 1.2', require: false # complements bundler-audit
gem 'sinatra', '>= 2.0', require: false # Web server
gem 'sinatra-activerecord', '>= 2.0', require: false # for Active Record models
gem 'sinatra-contrib', '>= 2.0', require: false # Sinatra extensions
gem 'sinatra-initializers', '>= 0.1', require: false # config initializers for sinatra
gem 'validates_timeliness', '>= 4.0', require: false # validate dates and times

group :test do
  gem 'database_cleaner', '>= 1.6', require: false # for test database cleaning
  gem 'factory_bot', '>= 4.0', require: false # for test data setup
  gem 'fuubar', '>= 2.3', require: false # rspec formatter
  gem 'rack-test', '>= 1.0', require: false # for testing rake servers
  gem 'rspec', '>= 3.7', require: false # for behavioral driven testing
  gem 'simplecov', '>= 0.16', require: false # for code coverage
  gem 'simplecov-console', '>= 0.4', require: false # code coverage to console
  gem 'strong_migrations', '>= 0.2', require: false # ensure safe migrations
  gem 'timecop', '>= 0.9', require: false # testing time dependent code
end

group :development, :test do
  gem 'bullet', '>= 5.7', require: false # find slow ActiveRecord queries
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '>= 10.0', platforms: %i[mri mingw x64_mingw]
  gem 'overcommit', '>= 0.4', require: false # git hooks
  gem 'pry-byebug', '>= 3.6', require: false # step by step debugging
  gem 'reek', '>= 4.8', require: false # find code smells
  gem 'rubocop', '>= 0.5', require: false # syntax checking
  gem 'travis', '>= 1.8', require: false # for continuous integrations
  gem 'warning', '>= 0.1', require: false # customize warnings
end

group :doc do
  gem 'sdoc', '>= 1.0', require: false # static documentation
end

group :production, :test do
  gem 'rack-ssl', '>= 1.4', require: false # ssl for rack in production
end

group :windows do
  gem 'win32console', '>= 1.3', require: false if Gem.win_platform? # color code coverage
end
