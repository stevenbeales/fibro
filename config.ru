# frozen_string_literal: true

require 'rubygems'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

# Compress responses
use Rack::Deflater

require './app'
run Sinatra::MyApp
