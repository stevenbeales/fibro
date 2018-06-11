# frozen_string_literal: true

require 'sinatra/base'

# Namespace in Sinatra namespace
module Sinatra
  # Main entry point for Alexa request
  module Fibro
    # Helpers to be used in registering Sinatra app
    module Helpers
      def build_response(echo_request, response)
        alexa_response = AlexaResponseHandler.new(@user, echo_request, response)
        alexa_response.response
      end
    end

    # Add helper methods and end points to our Fibro app 
    def self.registered(app)
      app.helpers Fibro::Helpers
        
      app.get "/" do
        send_file settings.public_folder + '/index.html'
      end

      app.get "/privacy" do
        send_file settings.public_folder + '/privacy.html'
      end
    end
  end
  register Fibro
end
