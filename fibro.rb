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
      return alexa_service.launch_response if echo_request.launch_request?
      return alexa_service.end_session_response if echo_request.session_ended_request?

      response = case echo_request.intent_name
                 when "ConditionIntent"
                   alexa_service.condition_response
                 when "SymptomInfoIntent"
                   alexa_service.symptom_info_response
                 when "SymptomIntent"
                   alexa_service.symptom_response
                 when "EverybodyHurtsIntent"
                   alexa_service.everybody_hurts_response
                 when "AMAZON.NextIntent"
                   alexa_service.next_response
                 when "AMAZON.NoIntent"
                   alexa_service.no_response
                 when "AMAZON.PauseIntent"
                   alexa_service.pause_response
                 when "AMAZON.PreviousIntent"
                   alexa_service.previous_response
                 when "AMAZON.RepeatIntent"
                   alexa_service.repeat_response
                 when "AMAZON.ResumeIntent"
                   alexa_service.resume_response
                 when "AMAZON.YesIntent"
                   alexa_service.yes_response
                 when "AMAZON.StopIntent"
                   alexa_service.stop_response
                 when "AMAZON.CancelIntent"
                   alexa_service.cancel_response
                 when "AMAZON.HelpIntent"
                   alexa_service.help_response
                 when "AMAZON.StartOverIntent"
                   alexa_service.start_over_response
      end
      response
    end
  end
  register Fibro
end
