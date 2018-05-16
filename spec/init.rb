# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require 'database_cleaner'
require 'timecop'
require 'sinatra'
require 'alexa_web_service'
require 'factory_bot'
require './config/db'
require 'bullet' # needs to initialize after ActiveRecord config
require_relative 'shared_context_specs'
require_relative 'shared_example_specs'
require_relative 'test_constants'

require './app/models/init'
require './app/services/init'
require './app/speech_assets/init'
require './lib/sinatra/fibro'
