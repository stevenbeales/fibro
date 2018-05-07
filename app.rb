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
require 'ralyxa'
require_relative 'config/db'
require_relative 'app/app_constants'
require_relative 'app/models/init'
require_relative 'helpers'

# Main App Class and Entry Point
class App < Sinatra::Base
  include AppConstants
  enable :sessions
  enable :logging

  configure { set :server, :puma }
  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :log_file, File.dirname(__FILE__) + LOG_FILE
  set :error_log_file, File.dirname(__FILE__) + ERROR_LOG_FILE

  # Rack request logging
  configure do
    file = File.new(settings.log_file, 'a+')
    # ensure file flushes to disk automatically
    file.sync = true
    use Rack::CommonLogger, file
  end

  # Rack and custom error logging
  error_log = File.new(settings.error_log_file, 'a+')
  error_log.sync = true
  # ensure file flushes to disk automatically
  before do
    env["rack.errors"] = error_log
  end

  # Register initializers a la Rails
  register Sinatra::Initializers

  register Sinatra::ActiveRecordExtension

  helpers Sinatra::App::Helpers

  get "/" do
    send_file settings.public_folder + '/index.html'
  end

  # Entry point for requests from Amazon Alexa.
  # The incoming requests are dispatched to intents in the intents folder by Ralyxa.
  post '/' do
    error_log.write("Received request with headers:\n#{request.env}")

    begin
      Ralyxa::Skill.handle(request)
    rescue StandardError => exception
      Bugsnag.notify(exception)
    end
  end

  get "/privacy" do
    send_file settings.public_folder + '/privacy.html'
  end

  post '/rate-pain' do
    req_body = request.body.read
    error_log.write("REQUEST BODY: #{req_body}")
    req_params = JSON.parse req_body

    session = RatePain.get_session req_params
    resp_text = RatePainIntents.handle_intent session, req_params
    make_ssml_response resp_text, session.is_finished?
  end

  # For debugging
  get '/rate-pain' do
    error_log.write("Received request with headers:\n#{request.env}")
    rate_pain_session = RatePainSession.new
    resp_text = rate_pain_session.rate_pain
    make_ssml_response resp_text, false
  end
end
