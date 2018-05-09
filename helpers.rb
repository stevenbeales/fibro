# frozen_string_literal: true

# Helpers
module Sinatra
  module App
    # Helpers
    module Helpers
      def authenticated?
        !!session[:user_id]
      end

      def make_ssml_response(text, end_session = true, card = nil)
        response = {
          "version" => "1.0",
          "sessionAttributes" => {},
          "response" => {
            "outputSpeech" => {
              "type" => "SSML",
              "ssml" => text
            },
            "shouldEndSession" => end_session
          }
        }
        response["response"]["card"] = card if card
        response.to_json
      end
    end
  end
end
