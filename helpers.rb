# frozen_string_literal: true

require 'nokogiri'

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

      def readable_content(content)
        # Convert html to plain text and then split by newlines so pauses can be added
        html = Nokogiri::HTML(content)
        # Remove code snippets
        html.css("pre code").each { |pre| pre.swap(" Code Snippet. ") }
        # Squish multiple new lines into one
        text = html.text.gsub!(/[\n]+/, "\n")
        text.split("\n")
      end
    end
  end
end
