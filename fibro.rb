# frozen_string_literal: true

# Namespace under Sinatra
module Sinatra
  # Main entry point for Alexa request
  module Fibro
    def self.registered(app)
      app.post '/' do
        content_type :json

        # Uncomment this and include your skill id before submitting application for certification:
        # halt 400, "Invalid Application ID" unless @application_id == "your-skill-id"

        response = AlexaWebService::Response.new

        if @echo_request.launch_request?
          response.end_session = false
          response.spoken_response = AlexaService.launch_response
        elsif @echo_request.intent_name == "AMAZON.HelpIntent" || @echo_request.intent_name == "AMAZON.MoreIntent"
          response.end_session = false
          response.spoken_response = AlexaService.default_help_response
        elsif @echo_request.intent_name == "ConditionIntent"

        elsif @echo_request.intent_name == "SymptomIntent"

        elsif @echo_request.intent_name == "EverybodyHurtsIntent"
        elsif @echo_request.intent_name == "AMAZON.NextIntent"
        elsif @echo_request.intent_name == "AMAZON.NoIntent"
        elsif @echo_request.intent_name == "AMAZON.PauseIntent"
        elsif @echo_request.intent_name == "AMAZON.PreviousIntent"
        elsif @echo_request.intent_name == "AMAZON.RepeatIntent"
        elsif @echo_request.intent_name == "AMAZON.ResumeIntent"
        elsif @echo_request.intent_name == "AMAZON.YesIntent"

        elsif @echo_request.session_ended_request?
          response.end_session = true
        elsif @echo_request.intent_name == "AMAZON.StopIntent" || @echo_request.intent_name == "AMAZON.CancelIntent"
          response.spoken_response = AlexaService.cancel_response
          response.end_session = true
        elsif @echo_request.intent_name == "AMAZON.NavigateHomeIntent" ||
              @echo_request.intent_name == 'AMAZON.StartOverIntent'
          response.end_session = false
          response.session_attributes = {}
          response.spoken_response = AlexaService.start_over_response
        end

        response.post
      end
    end
  end
  register Fibro
end
