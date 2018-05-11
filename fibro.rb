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

        response = build_response(@echo_request, AlexaWebService::Response.new)
        response.post
      end
    end

    def build_response(echo_request, response)
      alexa_service = AlexaService.new(@user, response)
      if echo_request.launch_request?
        response = alexa_service.launch_response
      elsif echo_request.intent_name == "ConditionIntent"

      elsif echo_request.intent_name == "SymptomInfoIntent"

      elsif echo_request.intent_name == "SymptomIntent"

      elsif echo_request.intent_name == "EverybodyHurtsIntent"
      elsif echo_request.intent_name == "AMAZON.NextIntent"
      elsif echo_request.intent_name == "AMAZON.NoIntent"
      elsif echo_request.intent_name == "AMAZON.PauseIntent"
      elsif echo_request.intent_name == "AMAZON.PreviousIntent"
      elsif echo_request.intent_name == "AMAZON.RepeatIntent"
      elsif echo_request.intent_name == "AMAZON.ResumeIntent"
      elsif echo_request.intent_name == "AMAZON.YesIntent"

      elsif echo_request.intent_name == "AMAZON.StopIntent"
        response = alexa_service.goodbye_response
      elsif echo_request.intent_name == "AMAZON.CancelIntent"
        response = alexa_service.cancel_response
      elsif echo_request.session_ended_request?
        response.end_session = true
      elsif help?
        response = alexa_service.help_response
      elsif start_over?
        response = alexa_service.start_over_response
      end
      response
    end

    def help?
      echo_request.intent_name == "AMAZON.HelpIntent" ||
        echo_request.intent_name == "AMAZON.MoreIntent"
    end

    def start_over?
      echo_request.intent_name == "AMAZON.NavigateHomeIntent" ||
        echo_request.intent_name == 'AMAZON.StartOverIntent'
    end
  end
  register Fibro
end
