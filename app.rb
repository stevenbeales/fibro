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
require 'sinatra/reloader' if development?
require 'alexa_web_service'
require 'logger'
require_relative 'config/db'
require_relative 'app/app_constants'
require_relative 'app/models/init'
require_relative 'helpers'
require_relative 'fibro'

# Namespace App under Sinatra
module Sinatra
  # Main App Class and Entry Point
  class MyApp < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    set :protection, except: :json_csrf
    register Sinatra::Fibro

    include AppConstants
    helpers Sinatra::Cookies
    enable :inline_templates
    enable :sessions
    enable :logging

    configure { set :server, :puma }
    set :log_file, File.dirname(__FILE__) + LOG_FILE
    set :error_log_file, File.dirname(__FILE__) + ERROR_LOG_FILE

    register Sinatra::Contrib

    # Register initializers a la Rails
    register Sinatra::Initializers

    register Sinatra::ActiveRecordExtension

    helpers Sinatra::App::Helpers
    helpers Sinatra::CustomLogger

    # Rack request logging
    configure do
      file = File.new(settings.log_file, 'a+')
      # ensure file flushes to disk automatically
      file.sync = true
      use Rack::CommonLogger, file
    end

    # Rack error logging
    error_log = File.new(settings.error_log_file, 'a+')
    error_log.sync = true
    # ensure file flushes to disk automatically
    before do
      env["rack.errors"] = error_log
    end

    # custom logging
    configure do
      logger = Logger.new(File.open("#{root}/log/#{environment}.log", 'a+'))
      logger.level = Logger::DEBUG if development?
      set :logger, logger
    end

    get "/" do
      send_file settings.public_folder + '/index.html'
    end

    # Entry point for requests from Amazon Alexa.
    before do
      if request.request_method == "POST"
        content_type :json, 'charset' => 'utf-8'
        logger.info("Received request with headers:\n#{request.env}")
        @data = request.body.read
        begin
          params.merge!(::JSON.parse(@data))
        rescue ::JSON::ParserError => exception
          Bugsnag.notify(exception)
          halt 400, "Bad Request"
        end

        params.merge!(::JSON.parse(@data))

        # The request object.
        @echo_request = AlexaWebService::Request.new(::JSON.parse(@data))

        # Boolean: does the Alexa Device handling the response have a screen?
        # (Needed for AlexaWebService::DisplayDirective support)
        @display_support = begin
          ::JSON.parse(@data)["context"]["System"]["device"]["supportedInterfaces"]["Display"].any?
        rescue ::JSON::ParserError
          false
        end
        # This can be used in your skill as additional verification that the request is coming
        # from the right place
        @application_id = @echo_request.application_id

        # If the request body has been read, you need to rewind it.
        request.body.rewind
        AlexaWebService::Verify.new(request.env, request.body.read)
      end
    end

    get "/privacy" do
      send_file settings.public_folder + '/privacy.html'
    end
    run! unless test?
  end
end
