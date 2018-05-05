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
require './app/app_constants'
require 'json'
require 'net/http'
require 'uri'
require 'nokogiri'
require 'alexa_verifier'
require_relative 'rate_pain'
require_relative 'helpers'

# Main App Class and Entry Point
class App < Sinatra::Base
  PADDING_LEN = 25 # for the type: "SSML" and ssml: parts
  OPENING_TAG = "<speak>"
  CLOSING_TAG = "</speak>"
  MAX_RESPONSE_LEN = 8000 # Give extra characters for conversion to json

  configure { set :server, :puma }
  set :app_file, __FILE__
  set :root, File.dirname(__FILE__)
  set :public_folder, File.dirname(__FILE__) + '/public'
  set :log_file, File.dirname(__FILE__) + AppConstants::LOG_FILE
  enable :sessions

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
    puts "Received request with headers:\n#{request.env}"

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
    puts "REQUEST BODY: #{req_body}"
    req_params = JSON.parse req_body

    session = RatePain.get_session req_params
    resp_text = RatePainIntents.handle_intent session, req_params
    make_ssml_response resp_text, session.is_finished?
  end

  # For debugging
  get '/rate-pain' do
    puts "Received request with headers:\n#{request.env}"
    rate_pain_session = RatePainSession.new
    resp_text = rate_pain_session.rate_pain
    make_ssml_response resp_text, false
  end

  def self.readable_content(content)
    # Convert html to plain text and then split by newlines so pauses can be added
    html = Nokogiri::HTML(content)
    # Remove code snippets
    html.css("pre code").each { |pre| pre.swap(" Code Snippet. ") }
    # Squish multiple new lines into one
    text = html.text.gsub!(/[\n]+/, "\n")
    text.split("\n")
  end
end
