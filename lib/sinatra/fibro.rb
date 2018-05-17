# frozen_string_literal: true

require 'sinatra/base'

# Namespace under Sinatra
module Sinatra
  # Main entry point for Alexa request
  module Fibro
    # Helpers
    module Helpers
      def build_response(echo_request, response)
        alexa_response = AlexaResponseHandler.new(@user, echo_request, response)
        alexa_response.response
      end
    end

    def self.registered(app)
      app.helpers Fibro::Helpers
    end
  end
  register Fibro
end
