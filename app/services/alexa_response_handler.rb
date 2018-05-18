# frozen_string_literal: true

require_relative 'amazon_response'
require_relative 'response_helpers'

# Class to define custom responses to Alexa intent request
class AlexaResponseHandler
  include ResponseHelpers

  def initialize(user, echo_request, response)
    @user = user
    @echo_request = echo_request
    @response = response
  end

  def response
    return launch_response if @echo_request.launch_request?
    return end_session_response if @echo_request.session_ended_request?

    case @echo_request.intent_name
    when /Read/
      read_response = ReadResponse.new(@echo_request, @response)
      read_response.response
    when /Symptom/
      symptom_response = SymptomResponse.new(@echo_request, @response)
      symptom_response.response
    when /AMAZON/
      amazon_response = AmazonResponse.new(@echo_request, @response)
      amazon_response.response
    when 'ConditionIntent'
      condition_response
    when 'EverybodyHurtsIntent'
      everybody_hurts_response
    else
      help_response
    end
  end
end
