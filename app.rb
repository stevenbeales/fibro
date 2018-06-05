# frozen_string_literal: true

# This program is an Alexa skill web service for Fibromyalgia sufferers.
# It is a Sinatra web application that communicates requests and responses to Amazon.
# This web application sits behind the https://github.com/stevenbeales/fibro-friend Alexa skill
#
# Author::    Steven Beales  (mailto:stevenbeales@gmail.com)
# Copyright:: Copyright (c) 2018 Ardint
# License::   MIT

require_relative 'init'

# Namespace App under Sinatra
module Sinatra
  # Main App Class and Entry Point
  class MyApp < Sinatra::Base
    register Sinatra::Fibro
    register Sinatra::Contrib
    register Sinatra::Initializers
    register Sinatra::ActiveRecordExtension
    helpers Sinatra::CustomLogger

    set :root, File.dirname(File.expand_path(__FILE__))
    set :protection, except: :json_csrf
    set :server, :puma
    set :log_file, settings.root + AppConstants::LOG_FILE
    enable :sessions
    enable :logging

    # Rack request logging
    configure do
      file = File.new(settings.log_file, 'a+')
      file.sync = true # ensure file flushes to disk automatically
      use Rack::CommonLogger, file
    end

    # Pre process requests from Amazon Alexa.
    before do
      if request.request_method == "POST"
        content_type :json, 'charset' => 'utf-8'
        Bugsnag.notify("Received request with headers:\n#{request.env}")
        @data = request.body.read
        begin
          params.merge!(::JSON.parse(@data))
          # The request object.
          @echo_request = AlexaWebService::Request.new(::JSON.parse(@data))
          @user = User.authenticate(@echo_request.user_id)
          # If the request body has been read, you need to rewind it.
          request.body.rewind
          AlexaWebService::Verify.new(request.env, request.body.read)
        rescue StandardError => exception
          Bugsnag.notify(exception)
        end
      end
    end

    post '/' do
      # build_response helper method is registered in lib/sinatra/fibro module
      response = build_response(@echo_request, AlexaWebService::Response.new)
      response.post
    end
  end
end
