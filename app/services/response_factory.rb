# frozen_string_literal: true

# Factory class that returns the correct Response Class for a Alexa request
class ResponseFactory
  include ResponseHelpers
  def initialize(echo_request, echo_response)
    @echo_request = echo_request
    @echo_response = echo_response
  end

  def response
    case @echo_request.intent_name
    when /Read/
      read_response = ReadResponse.new(@echo_request, @echo_response)
      read_response.response
    when /Symptom/
      symptom_response = SymptomResponse.new(@echo_request, @echo_response)
      symptom_response.response
    when /AMAZON/
      amazon_response = AmazonResponse.new(@echo_request, @echo_response)
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
