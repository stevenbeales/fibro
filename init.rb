# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra-initializers'
require 'sinatra/contrib'
require 'sinatra/cookies'
require 'sinatra/custom_logger'
require_relative 'lib/sinatra/fibro'
require 'alexa_web_service'
require 'logger'
require_relative 'config/db'
require_relative 'app/app_constants'
require_relative 'app/models/init'
require 'pry-byebug' if test?
