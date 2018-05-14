# frozen_string_literal: true

# This program is an Alexa skill web service for Fibromyalgia sufferers.
# It is a Sinatra web application that communicates requests and responses to Amazon.
# This web application sits behind the https://github.com/stevenbeales/fibro-friend Alexa skill
#
# Author::    Steven Beales  (mailto:stevenbeales@gmail.com)
# Copyright:: Copyright (c) 2018 Ardint
# License::   MIT

require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra-initializers'
require 'sinatra/contrib'
require 'sinatra/cookies'
require 'sinatra/custom_logger'
require_relative 'lib/sinatra/fibro'
require 'sinatra/reloader' if development?
require 'alexa_web_service'
require 'logger'
require_relative 'config/db'
require_relative 'app/app_constants'
require_relative 'app/models/init'
require 'pry-byebug' if test?

# Namespace App under Sinatra
module Sinatra
  # Main App Class and Entry Point
  class MyApp < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    set :protection, except: :json_csrf
    register Sinatra::Fibro
    register Sinatra::Contrib

    include AppConstants
    helpers Sinatra::Cookies
    enable :inline_templates
    enable :sessions
    enable :logging

    configure { set :server, :puma }
    set :log_file, File.dirname(__FILE__) + LOG_FILE
    set :error_log_file, File.dirname(__FILE__) + ERROR_LOG_FILE

    # Register initializers a la Rails
    register Sinatra::Initializers
    register Sinatra::ActiveRecordExtension

    helpers Sinatra::CustomLogger

    # Rack request logging
    configure do
      file = File.new(settings.log_file, 'a+')
      file.sync = true # ensure file flushes to disk automatically
      use Rack::CommonLogger, file
    end

    # Rack error logging
    error_log = File.new(settings.error_log_file, 'a+')
    error_log.sync = true # ensure file flushes to disk automatically

    # custom logging
    configure do
      logger = Logger.new(File.open("#{root}/log/#{environment}.log", 'a+'))
      logger.level = Logger::DEBUG if development?
      set :logger, logger
    end

    # Pre process requests from Amazon Alexa.
    before do
      env["rack.errors"] = error_log
      if request.request_method == "POST"
        content_type :json, 'charset' => 'utf-8'
        logger.info("Received request with headers:\n#{request.env}")
        @data = request.body.read
        begin
          params.merge!(::JSON.parse(@data))
          # The request object.
          @echo_request = AlexaWebService::Request.new(::JSON.parse(@data))
          @user = User.authenticate(@echo_request.user_id) unless ENV['RACK_ENV'] == 'test'

          # If the request body has been read, you need to rewind it.
          request.body.rewind

          AlexaWebService::Verify.new(request.env, request.body.read)
        rescue ::JSON::ParserError => exception
          Bugsnag.notify(exception)
          # @echo_request = ::JSON.parse(File.read('./db/fixtures/LaunchRequest.json')) if ENV['RACK_ENV'] == 'test'
        end
      end
    end

    post '/' do
      content_type :json

      # build_response helper method registered in fibro module
      response = build_response(@echo_request, AlexaWebService::Response.new)
      response.post
    end

    get "/" do
      send_file settings.public_folder + '/index.html'
    end

    get "/privacy" do
      send_file settings.public_folder + '/privacy.html'
    end
  end
end
