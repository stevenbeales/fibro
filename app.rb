# frozen_string_literal: true

# This program is an Alexa skill web service for Fibromyalgia sufferers.
# It is a Sinatra web application that communicates requests and responses to Amazon.
# This web application sits behind the https://github.com/stevenbeales/fibro-friend Alexa skill
#
# Author::    Steven Beales  (mailto:stevenbeales@gmail.com)
# Copyright:: Copyright (c) 2018 Ardint
# License::   MIT

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-initializers'
require_relative 'config/db'

configure { set :server, :puma }
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :public_folder, File.dirname(__FILE__) + '/public'
enable :sessions

# Register initializers a la Rails
register Sinatra::Initializers

register Sinatra::ActiveRecordExtension

get "/" do
  redirect '/index.html'
end

# Entry point for requests from Amazon Alexa.
# The incoming requests are dispatched to intents in the intents folder by Ralyxa.
post '/' do
  begin
    request
  rescue StandardError => exception
    Bugsnag.notify(exception)
  end
end
